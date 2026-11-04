import 'dart:developer' as developer;

/// Severity of an application diagnostic event.
enum AppLogLevel {
  /// Detailed diagnostic information for development and troubleshooting.
  debug(500),

  /// An expected application event worth recording.
  info(800),

  /// An unexpected condition that did not stop the operation.
  warning(900),

  /// An operation failed or an application error occurred.
  error(1000);

  const AppLogLevel(this.developerLevel);

  /// The corresponding level used by `dart:developer`.
  final int developerLevel;
}

/// A sanitized diagnostic entry ready for an output sink.
final class AppLogEntry {
  /// Creates a diagnostic entry.
  const AppLogEntry({
    required this.level,
    required this.message,
    required this.context,
    this.errorType,
    this.stackTrace,
  });

  /// Severity of this entry.
  final AppLogLevel level;

  /// Message after sensitive text has been redacted.
  final String message;

  /// Recursively sanitized structured context.
  final Map<String, Object?> context;

  /// Runtime type of an associated error, never its raw message.
  final String? errorType;

  /// Sanitized stack trace, when supplied.
  final String? stackTrace;
}

/// Receives entries only after the logger has sanitized them.
typedef LogWriter = void Function(AppLogEntry entry);

/// Central application logger with redaction before every output boundary.
///
/// The default writer uses `dart:developer`. Tests and consuming apps can
/// supply a writer without introducing a logging dependency. Do not pass
/// request/response bodies or other sensitive data as diagnostic context.
final class AppLogger {
  /// Creates a logger.
  ///
  /// Set [enabled] to false to suppress all output, or provide [writer] to
  /// route sanitized entries to a controlled diagnostic sink.
  AppLogger({
    LogWriter? writer,
    this.enabled = true,
  }) : _writer = writer ?? _writeToDeveloperLog;

  final LogWriter _writer;

  /// Whether this logger emits entries.
  final bool enabled;

  /// Records a diagnostic event after sanitizing all supplied data.
  ///
  /// Only the error's runtime type is retained. Its message is deliberately
  /// discarded because exception text may contain credentials or user data.
  void log(
    AppLogLevel level,
    String message, {
    Map<String, Object?> context = const <String, Object?>{},
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!enabled) {
      return;
    }

    final safeContext = _sanitizeMap(context);
    final entry = AppLogEntry(
      level: level,
      message: _redactText(message),
      context: safeContext,
      errorType: error?.runtimeType.toString(),
      stackTrace: stackTrace == null ? null : _redactText(stackTrace.toString()),
    );

    _writer(entry);
  }
}

const _redactedValue = '[REDACTED]';

final _sensitiveKeyPattern = RegExp(
  r'(?:password|passwd|secret|token|authorization|cookie|api[_-]?key|'
  r'access[_-]?key|credential|session|ssn|cvv|card[_-]?number|email|'
  r'phone|user[_-]?id)',
  caseSensitive: false,
);

final _bearerPattern = RegExp(
  r'\bBearer\s+[A-Za-z0-9._~+/=-]+',
  caseSensitive: false,
);

final _keyValueSecretPattern = RegExp(
  r'''(\b(?:password|passwd|secret|token|access[_-]?token|refresh[_-]?token|api[_-]?key|authorization|cookie)\b\s*[:=]\s*)("[^"]*"|'[^']*'|[^\s,;]+)''',
  caseSensitive: false,
);

final _querySecretPattern = RegExp(
  r'([?&](?:password|secret|token|access_token|refresh_token|api_key|key)=)'
  r'[^&#\s]+',
  caseSensitive: false,
);

final _emailPattern = RegExp(
  r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
  caseSensitive: false,
);

Map<String, Object?> _sanitizeMap(Map<String, Object?> values) {
  final sanitized = <String, Object?>{};

  for (final entry in values.entries) {
    sanitized[entry.key] = _sensitiveKeyPattern.hasMatch(entry.key)
        ? _redactedValue
        : _sanitizeValue(entry.value);
  }

  return Map<String, Object?>.unmodifiable(sanitized);
}

Object? _sanitizeValue(Object? value) {
  if (value == null || value is bool || value is num) {
    return value;
  }

  if (value is String) {
    return _redactText(value);
  }

  if (value is Map<Object?, Object?>) {
    final sanitized = <String, Object?>{};

    for (final entry in value.entries) {
      final key = entry.key;
      if (key is! String) {
        continue;
      }

      sanitized[key] = _sensitiveKeyPattern.hasMatch(key)
          ? _redactedValue
          : _sanitizeValue(entry.value);
    }

    return Map<String, Object?>.unmodifiable(sanitized);
  }

  if (value is Iterable<Object?>) {
    return List<Object?>.unmodifiable(value.map(_sanitizeValue));
  }

  // Arbitrary objects may expose secrets through toString().
  return '[unsupported]';
}

String _redactText(String value) {
  return value
      .replaceAll(_bearerPattern, 'Bearer $_redactedValue')
      .replaceAllMapped(
        _keyValueSecretPattern,
        (match) => '${match[1]}$_redactedValue',
      )
      .replaceAllMapped(
        _querySecretPattern,
        (match) => '${match[1]}$_redactedValue',
      )
      .replaceAll(_emailPattern, '[REDACTED_EMAIL]');
}

void _writeToDeveloperLog(AppLogEntry entry) {
  final message = entry.context.isEmpty
      ? entry.message
      : '${entry.message} | context: ${entry.context}';

  developer.log(
    message,
    name: 'starter_kit',
    level: entry.level.developerLevel,
    error: entry.errorType,
    stackTrace: entry.stackTrace == null
        ? null
        : StackTrace.fromString(entry.stackTrace!),
  );
}
