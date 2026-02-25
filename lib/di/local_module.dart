import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_bloc/hive_registrar.g.dart';

@module
abstract class LocalModule {
  @preResolve
  Future<SharedPreferences> sharedPreferences() =>
      SharedPreferences.getInstance();

  @preResolve
  Future<HiveInterface> hive() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    Hive.registerAdapters();
    return Hive;
  }
}
