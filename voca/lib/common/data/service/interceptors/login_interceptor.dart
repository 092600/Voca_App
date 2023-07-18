import 'package:dio/dio.dart';

class LoginInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403) {
      print("403");
    }

    // TODO: implement onError
    super.onError(err, handler);
  }
}
