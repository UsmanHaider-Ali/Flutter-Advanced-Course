import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/app/constants.dart';
import 'package:flutter_advanced_course/data/responses/responses.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/user/login")
  Future<UserResponse> login();
}
