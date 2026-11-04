import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/core/logging/app_logger.dart';

void main() {
  group('AppLogger', () {
    test('redacts secrets and email addresses from messages', () {
      final entries = <AppLogEntry>[];
      final logger = AppLogger(writer: entries.add);

      logger.log(
        AppLogLevel.warning,
        'Request failed: Bearer abc.def access_token=private-value '
        'for person@example.com',
      );

      final message = entries.single.message;
      expect(message, contains('Bearer [REDACTED]'));
      expect(message, contains('access_token=[REDACTED]'));
      expect(message, contains('[REDACTED_EMAIL]'));
      expect(message, isNot(contains('abc.def')));
      expect(message, isNot(contains('private-value')));
      expect(message, isNot(contains('person@example.com')));
    });

    test('recursively redacts sensitive context keys and values', () {
      final entries = <AppLogEntry>[];
      final logger = AppLogger(writer: entries.add);

      logger.log(
        AppLogLevel.info,
        'Request completed',
        context: <String, Object?>{
          'requestId': 'req-123',
          'Authorization': 'Bearer top-secret',
          'userEmail': 'person@example.com',
          'nested': <String, Object?>{
            'api_key': 'nested-secret',
            'attempt': 2,
          },
          'items': <Object?>[
            <String, Object?>{'refreshToken': 'refresh-secret'},
          ],
        },
      );

      final context = entries.single.context;
      expect(context['requestId'], 'req-123');
      expect(context['Authorization'], '[REDACTED]');
      expect(context['userEmail'], '[REDACTED]');
      expect(
        (context['nested']! as Map<String, Object?>)['api_key'],
        '[REDACTED]',
      );
      expect(
        (context['nested']! as Map<String, Object?>)['attempt'],
        2,
      );
      final items = context['items']! as List<Object?>;
      expect(
        (items.single as Map<String, Object?>)['refreshToken'],
        '[REDACTED]',
      );
    });

    test('keeps only the error type and redacts stack trace text', () {
      final entries = <AppLogEntry>[];
      final logger = AppLogger(writer: entries.add);

      logger.log(
        AppLogLevel.error,
        'Operation failed',
        error: StateError('password=do-not-log'),
        stackTrace: StackTrace.fromString(
          'at call (https://example.test/path?token=private-token) '
          'person@example.com',
        ),
      );

      final entry = entries.single;
      expect(entry.errorType, 'StateError');
      expect(entry.stackTrace, contains('token=[REDACTED]'));
      expect(entry.stackTrace, contains('[REDACTED_EMAIL]'));
      expect(entry.stackTrace, isNot(contains('private-token')));
      expect(entry.errorType, isNot(contains('do-not-log')));
    });

    test('does not call the writer when disabled', () {
      var writeCount = 0;
      final logger = AppLogger(
        enabled: false,
        writer: (_) => writeCount++,
      );

      logger.log(AppLogLevel.error, 'Must not be emitted');

      expect(writeCount, 0);
    });

    test('does not stringify arbitrary context objects', () {
      final entries = <AppLogEntry>[];
      final logger = AppLogger(writer: entries.add);

      logger.log(
        AppLogLevel.debug,
        'Diagnostic',
        context: <String, Object?>{'object': _SecretObject()},
      );

      expect(entries.single.context['object'], '[unsupported]');
    });
  });
}

final class _SecretObject {
  @override
  String toString() => 'private-value-that-must-not-leak';
}
