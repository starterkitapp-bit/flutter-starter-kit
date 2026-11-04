import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/core/network/dio_client.dart';

void main() {
  group('createDio', () {
    test('uses a configurable base URL and bounded default timeouts', () {
      final dio = createDio(baseUrl: 'https://api.example.test');

      expect(dio.options.baseUrl, 'https://api.example.test');
      expect(dio.options.connectTimeout, const Duration(seconds: 15));
      expect(dio.options.sendTimeout, const Duration(seconds: 15));
      expect(dio.options.receiveTimeout, const Duration(seconds: 15));
      expect(dio.options.headers['Accept'], 'application/json');

      dio.close();
    });

    test('allows timeout overrides and caller-supplied interceptors', () {
      final interceptor = Interceptor();
      final dio = createDio(
        connectTimeout: const Duration(seconds: 3),
        sendTimeout: const Duration(seconds: 4),
        receiveTimeout: const Duration(seconds: 5),
        interceptors: <Interceptor>[interceptor],
      );

      expect(dio.options.connectTimeout, const Duration(seconds: 3));
      expect(dio.options.sendTimeout, const Duration(seconds: 4));
      expect(dio.options.receiveTimeout, const Duration(seconds: 5));
      expect(dio.interceptors, contains(interceptor));

      dio.close();
    });
  });
}
