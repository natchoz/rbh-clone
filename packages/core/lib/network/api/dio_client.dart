import 'package:core/network/api/api_configuration.dart';
import 'package:dio/dio.dart';

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
    return dio;
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
