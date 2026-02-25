import 'package:injectable/injectable.dart';
import 'package:template_bloc/data/pref/pref_store.dart';
import 'package:template_bloc/domain/usecases/use_case.dart';

@injectable
class ToggleAppThemeUseCase extends UseCase<void, ToggleAppThemeParam> {
  ToggleAppThemeUseCase(this._pref);

  final PrefStore _pref;

  @override
  Future<bool> call({required ToggleAppThemeParam params}) async {
    final isDark = _pref.isDarkMode();
    await _pref.setDarkMode(!isDark);
    return !isDark;
  }
}

class ToggleAppThemeParam {
  ToggleAppThemeParam();
}
