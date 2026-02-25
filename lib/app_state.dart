part of 'app_bloc.dart';

@freezed
abstract class AppState extends BaseState with _$AppState {
  const factory AppState({
    @Default(PageStatus.Loaded) PageStatus pageStatus,
    @Default(ThemeMode.light) ThemeMode mode,
    @Default(Language.english) Language currentLanguage,
  }) = _AppState;

  const AppState._({super.pageStatus = PageStatus.Loaded, super.pageErrorMessage});
}
