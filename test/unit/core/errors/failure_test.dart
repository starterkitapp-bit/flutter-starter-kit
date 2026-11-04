import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/core/errors/failure.dart';

void main() {
  group('Failure', () {
    test('all failure types are exceptions', () {
      final failures = <Failure>[
        const NetworkFailure(),
        const TimeoutFailure(),
        const UnauthorizedFailure(),
        const ForbiddenFailure(),
        const NotFoundFailure(),
        const ConflictFailure(),
        const ValidationFailure(),
        const RateLimitedFailure(),
        const ServerFailure(),
        const CancelledFailure(),
        const UnknownFailure(),
      ];

      expect(failures, everyElement(isA<Exception>()));
    });

    test('preserves safe server retry metadata', () {
      const retryAfter = Duration(seconds: 30);
      const rateLimited = RateLimitedFailure(retryAfter: retryAfter);
      const server = ServerFailure(statusCode: 503);

      expect(rateLimited.retryAfter, retryAfter);
      expect(server.statusCode, 503);
    });

    test('does not require retaining raw transport exceptions', () {
      const failure = UnknownFailure();

      expect(failure, isA<Failure>());
      expect(failure, isA<Exception>());
    });
  });
}
