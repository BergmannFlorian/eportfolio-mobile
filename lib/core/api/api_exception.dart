import 'package:dio/dio.dart';

/// Errors raised by [PortfolioApi]. UI code maps them to localized messages.
sealed class ApiException implements Exception {
  const ApiException();

  /// Builds the matching exception from a Dio failure.
  factory ApiException.fromDio(DioException error) {
    final response = error.response;
    if (response == null) {
      return NetworkException(error.message ?? error.type.name);
    }
    final status = response.statusCode ?? 0;
    return HttpStatusException(status, _errorMessage(response.data) ?? '');
  }

  /// Extracts `error.message` from `{ "error": { "status", "message" } }`.
  static String? _errorMessage(Object? body) {
    if (body is Map && body['error'] is Map) {
      final message = (body['error'] as Map)['message'];
      if (message is String) return message;
    }
    return null;
  }
}

/// No response at all: offline, DNS failure, timeout…
final class NetworkException extends ApiException {
  const NetworkException(this.details);

  final String details;

  @override
  String toString() => 'NetworkException($details)';
}

/// The server answered with a non-2xx status.
final class HttpStatusException extends ApiException {
  const HttpStatusException(this.status, this.message);

  final int status;
  final String message;

  bool get isServerError => status >= 500;

  @override
  String toString() => 'HttpStatusException($status, $message)';
}

/// The body could not be decoded into the expected model.
final class InvalidResponseException extends ApiException {
  const InvalidResponseException(this.cause);

  final Object cause;

  @override
  String toString() => 'InvalidResponseException($cause)';
}
