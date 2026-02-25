import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:template_bloc/data/local/hive_store.dart';
import 'package:template_bloc/data/pref/pref_store.dart';
import 'package:template_bloc/data/remote/datasources/user_remote_datasource.dart';
import 'package:template_bloc/domain/entities/user.dart';
import 'package:template_bloc/domain/repositories/user_repository.dart';
import 'package:template_bloc/shared/common/error_entity/app_exception.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._remoteDataSource, this._hiveStore, this._prefStore);

  final UserRemoteDataSource _remoteDataSource;
  final HiveStore _hiveStore;
  final PrefStore _prefStore;

  @override
  Future<User> getProfile() async {
    try {
      final response = await _remoteDataSource.getUserProfile();
      await _hiveStore.saveUser(response.toCacheModel());
      return response.toEntity();
    } on DioException {
      final cached = await _hiveStore.getUser();
      if (cached != null) {
        return cached.toEntity();
      }
      throw AppException.network();
    } catch (e) {
      throw AppException.unknown(e);
    }
  }

  @override
  Future<User> login({required String username, required String password}) async {
    try {
      final response = await _remoteDataSource.login(username: username, password: password);
      await _prefStore.saveAccessToken(response.accessToken);
      await _prefStore.saveUserId(response.user.id);
      await _hiveStore.saveUser(response.user.toCacheModel());
      return response.user.toEntity();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AppException.unauthorized();
      }
      throw AppException.network();
    } catch (e) {
      throw AppException.unknown(e);
    }
  }

  @override
  Future<void> logout() async {
    await _prefStore.clearAccessToken();
    await _prefStore.clearUserId();
    await _hiveStore.deleteUser();
  }
}
