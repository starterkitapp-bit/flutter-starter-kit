/// A safe, transport-independent failure that can cross application layers.
sealed class Failure implements Exception {
  /// Creates a failure.
  const Failure();
}

/// A request could not reach the remote service.
final class NetworkFailure extends Failure {
  /// Creates a network failure.
  const NetworkFailure();
}

/// A request exceeded its configured time limit.
final class TimeoutFailure extends Failure {
  /// Creates a timeout failure.
  const TimeoutFailure();
}

/// The request requires an authenticated session.
final class UnauthorizedFailure extends Failure {
  /// Creates an unauthorized failure.
  const UnauthorizedFailure();
}

/// The current user is not allowed to perform the operation.
final class ForbiddenFailure extends Failure {
  /// Creates a forbidden failure.
  const ForbiddenFailure();
}

/// The requested resource does not exist.
final class NotFoundFailure extends Failure {
  /// Creates a not-found failure.
  const NotFoundFailure();
}

/// The request conflicts with the current resource state.
final class ConflictFailure extends Failure {
  /// Creates a conflict failure.
  const ConflictFailure();
}

/// The request contains invalid input.
final class ValidationFailure extends Failure {
  /// Creates a validation failure.
  const ValidationFailure();
}

/// The service rejected the request because of rate limiting.
final class RateLimitedFailure extends Failure {
  /// Creates a rate-limited failure.
  const RateLimitedFailure({this.retryAfter});

  /// The server-provided wait duration, when available.
  final Duration? retryAfter;
}

/// The remote service returned an unsuccessful server response.
final class ServerFailure extends Failure {
  /// Creates a server failure with an optional HTTP status code.
  const ServerFailure({this.statusCode});

  /// The HTTP status code, when one was received.
  final int? statusCode;
}

/// The operation was intentionally cancelled.
final class CancelledFailure extends Failure {
  /// Creates a cancelled failure.
  const CancelledFailure();
}

/// The failure could not be classified safely.
final class UnknownFailure extends Failure {
  /// Creates an unknown failure.
  const UnknownFailure();
}
