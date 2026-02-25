import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:template_bloc/data/remote/model/request/login_request.dart';
import 'package:template_bloc/data/remote/model/response/login_response.dart';
import 'package:template_bloc/data/remote/model/response/test_response.dart';
import 'package:template_bloc/data/remote/model/response/user_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/posts/{id}')
  Future<TestResponse> getTest(@Path('id') int id);

  @GET('/user/profile')
  Future<UserResponse> getUserProfile();

  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest body);
}
