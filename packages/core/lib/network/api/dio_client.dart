import 'dart:convert';

import 'package:core/network/api/api_configuration.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class DioClient {
  final ApiConfiguration configuration;

  DioClient({required this.configuration});

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
      baseUrl: configuration.baseUrlProd,
      contentType: Headers.jsonContentType,
    );
    final dio = Dio(options);
    dio.interceptors.add(MockInterceptor());
    return dio;
  }
}

class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/json';
  static const _jsonExtension = '.json';

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final resourcePath = _jsonDir + options.path + _jsonExtension;
    print("--- resourcePath: $resourcePath ---");

    try {
      final data = await rootBundle.load(resourcePath);
      final map = json.decode(
        utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        ),
      );

      return Future.delayed(
        const Duration(milliseconds: 500),
        () {
          handler.resolve(Response(
            requestOptions: options,
            data: map,
            statusCode: 200,
          ));
        },
      );
    } catch (e) {
      print("--- error: $e ---");

      return Future.delayed(
        const Duration(milliseconds: 500),
        () {
          handler.reject(DioError(
              requestOptions: options,
              type: DioErrorType.response,
              response: Response(
                  requestOptions: options,
                  statusCode: 404,
                  statusMessage: e.toString())));
        },
      );
    }

    // return handler.resolve(Response(
    //   requestOptions: options,
    //   data: map,
    //   statusCode: 200,
    // ));
  }
}

class AuthInterceptor extends Interceptor {
  final ApiConfiguration configuration;

  AuthInterceptor(this.configuration);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters = {
      'language': configuration.language,
    };

    return super.onRequest(options, handler);
  }
}
