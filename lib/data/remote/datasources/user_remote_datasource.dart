import 'package:injectable/injectable.dart';
import 'package:template_bloc/data/remote/model/request/login_request.dart';
import 'package:template_bloc/data/remote/model/response/login_response.dart';
import 'package:template_bloc/data/remote/model/response/user_response.dart';
import 'package:template_bloc/data/remote/services/api_service.dart';

abstract class UserRemoteDataSource {
  Future<UserResponse> getUserProfile();
  Future<LoginResponse> login({required String username, required String password});
}

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<UserResponse> getUserProfile() => _apiService.getUserProfile();

  @override
  Future<LoginResponse> login({required String username, required String password}) =>
      _apiService.login(LoginRequest(username: username, password: password));
}
