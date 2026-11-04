import 'package:dio/dio.dart';

/// Creates the shared HTTP client with consistent, bounded request timeouts.
///
/// The base URL is supplied by the consuming app's environment configuration.
/// Authentication, logging, and retry policies are deliberately opt-in.
Dio createDio({
  String baseUrl = '',
  Duration connectTimeout = const Duration(seconds: 15),
  Duration sendTimeout = const Duration(seconds: 15),
  Duration receiveTimeout = const Duration(seconds: 15),
  Iterable<Interceptor> interceptors = const <Interceptor>[],
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      headers: <String, dynamic>{'Accept': 'application/json'},
    ),
  );

  dio.interceptors.addAll(interceptors);
  return dio;
}
