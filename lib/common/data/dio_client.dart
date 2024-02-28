import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:flutter_starter/env.dart';

Dio dioClient(Ref ref) {
  final dio = Dio();

  dio.interceptors.addAll([
    // authTokenInterceptor(ref),
    // RequestLoggerInterceptor(),
    // requestHeadersInterceptor(ref),
    // RequestTimeInterceptor(),
  ]);

  const useHttp1 = Env.useHttp1;

  if (!useHttp1) {
    dio.httpClientAdapter = Http2Adapter(
      ConnectionManager(
        idleTimeout: const Duration(seconds: 10),
        onClientCreate: (_, config) {
          if (Env.proxyUrl != null) {
            config.proxy = Uri.parse(Env.proxyUrl!);
            config.onBadCertificate = (_) => true;
          }
        },
      ),
    );
  }

  return dio;
}
