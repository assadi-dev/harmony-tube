sealed class Failure {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const Failure({required this.message, this.cause, this.stackTrace});

  @override
  String toString() => '$runtimeType(message: $message, cause: $cause)';
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}

class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}

class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}
