import 'package:certificate_q/common/data/model/account/account.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../const/api_uris.dart';

part 'login_client.g.dart';

@RestApi(baseUrl: "$SERVER_IP/auth/")
abstract class LoginClient {
  factory LoginClient(Dio dio, {String baseUrl}) = _LoginClient;

  @POST("authenticate")
  Future<void> login(@Body() Account account);
}
