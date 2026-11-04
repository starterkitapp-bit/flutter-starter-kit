import 'package:dio/dio.dart';

import 'package:starter_kit/core/errors/failure.dart';

/// Converts Dio transport errors into safe, transport-independent failures.
///
/// Call this at a data boundary. Raw Dio exceptions and response bodies should
/// not escape into domain or presentation layers.
Failure mapDioException(DioException exception) {
  return switch (exception.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => const TimeoutFailure(),
    DioExceptionType.connectionError => const NetworkFailure(),
    DioExceptionType.cancel => const CancelledFailure(),
    DioExceptionType.badResponse => _mapResponse(exception.response),
    DioExceptionType.badCertificate || DioExceptionType.unknown =>
      const UnknownFailure(),
  };
}

Failure _mapResponse(Response<dynamic>? response) {
  final statusCode = response?.statusCode;
  if (statusCode == null) {
    return const UnknownFailure();
  }

  return switch (statusCode) {
    400 || 422 => const ValidationFailure(),
    401 => const UnauthorizedFailure(),
    403 => const ForbiddenFailure(),
    404 => const NotFoundFailure(),
    408 => const TimeoutFailure(),
    409 => const ConflictFailure(),
    429 => RateLimitedFailure(retryAfter: _retryAfter(response!)),
    >= 500 && < 600 => ServerFailure(statusCode: statusCode),
    _ => const UnknownFailure(),
  };
}

Duration? _retryAfter(Response<dynamic> response) {
  final value = response.headers.value('retry-after');
  final seconds = value == null ? null : int.tryParse(value.trim());

  if (seconds == null || seconds < 0) {
    return null;
  }

  return Duration(seconds: seconds);
}
