import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final apiKey = dotenv.get('API_KEY');
      if (apiKey.isEmpty) throw Exception('API_KEY not found in .env');

      options.headers['api-key'] =
          apiKey; // Или 'Authorization' в зависимости от API
      super.onRequest(options, handler);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'API_KEY configuration error: $e',
        ),
      );
    }
  }
}
