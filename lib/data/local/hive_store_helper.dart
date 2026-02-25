import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:template_bloc/data/local/hive_store.dart';
import 'package:template_bloc/data/local/model/user_cache_model.dart';

@Singleton(as: HiveStore)
class HiveStoreHelper extends HiveStore {
  static const _userBoxName = 'user_box';
  static const _userKey = 'current_user';

  Future<Box<UserCacheModel>> get _userBox async => Hive.isBoxOpen(_userBoxName)
      ? Hive.box<UserCacheModel>(_userBoxName)
      : await Hive.openBox<UserCacheModel>(_userBoxName);

  @override
  Future<UserCacheModel?> getUser() async {
    final box = await _userBox;
    return box.get(_userKey);
  }

  @override
  Future<void> saveUser(UserCacheModel user) async {
    final box = await _userBox;
    await box.put(_userKey, user);
  }

  @override
  Future<void> deleteUser() async {
    final box = await _userBox;
    await box.delete(_userKey);
  }
}
