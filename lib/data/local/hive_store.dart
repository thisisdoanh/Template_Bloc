import 'package:template_bloc/data/local/model/user_cache_model.dart';

abstract class HiveStore {
  Future<UserCacheModel?> getUser();
  Future<void> saveUser(UserCacheModel user);
  Future<void> deleteUser();
}
