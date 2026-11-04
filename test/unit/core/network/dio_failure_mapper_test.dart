import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/core/errors/failure.dart';
import 'package:starter_kit/core/network/dio_failure_mapper.dart';

void main() {
  group('mapDioException', () {
    test('maps timeout and cancellation transport errors', () {
      for (final type in <DioExceptionType>[
        DioExceptionType.connectionTimeout,
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.transformTimeout,
      ]) {
        expect(_exception(type: type), isA<TimeoutFailure>());
      }

      expect(
        _exception(type: DioExceptionType.cancel),
        isA<CancelledFailure>(),
      );
      expect(
        _exception(type: DioExceptionType.connectionError),
        isA<NetworkFailure>(),
      );
    });

    test('maps common HTTP response statuses', () {
      expect(_exception(statusCode: 400), isA<ValidationFailure>());
      expect(_exception(statusCode: 422), isA<ValidationFailure>());
      expect(_exception(statusCode: 401), isA<UnauthorizedFailure>());
      expect(_exception(statusCode: 403), isA<ForbiddenFailure>());
      expect(_exception(statusCode: 404), isA<NotFoundFailure>());
      expect(_exception(statusCode: 408), isA<TimeoutFailure>());
      expect(_exception(statusCode: 409), isA<ConflictFailure>());
      expect(_exception(statusCode: 503), isA<ServerFailure>());
      expect(
        (_exception(statusCode: 503) as ServerFailure).statusCode,
        503,
      );
    });

    test('preserves a numeric Retry-After value without inventing a delay', () {
      final failure = _exception(
        statusCode: 429,
        headers: <String, List<String>>{
          'retry-after': <String>['45'],
        },
      );

      expect(failure, isA<RateLimitedFailure>());
      expect(
        (failure as RateLimitedFailure).retryAfter,
        const Duration(seconds: 45),
      );
    });

    test('ignores malformed Retry-After and unknown response statuses', () {
      final rateLimited = _exception(
        statusCode: 429,
        headers: <String, List<String>>{
          'retry-after': <String>['later'],
        },
      );

      expect((rateLimited as RateLimitedFailure).retryAfter, isNull);
      expect(_exception(statusCode: 418), isA<UnknownFailure>());
      expect(
        _exception(type: DioExceptionType.badCertificate),
        isA<UnknownFailure>(),
      );
    });

    test('maps missing response metadata safely', () {
      expect(
        _exception(type: DioExceptionType.badResponse),
        isA<UnknownFailure>(),
      );
    });
  });
}

Failure _exception({
  DioExceptionType type = DioExceptionType.badResponse,
  int? statusCode,
  Map<String, List<String>> headers = const <String, List<String>>{},
}) {
  final requestOptions = RequestOptions(path: '/test');

  return mapDioException(
    DioException(
      requestOptions: requestOptions,
      type: type,
      response: statusCode == null
          ? null
          : Response<dynamic>(
              requestOptions: requestOptions,
              statusCode: statusCode,
              headers: Headers.fromMap(headers),
            ),
    ),
  );
}
