part of 'app_bloc.dart';

@freezed
sealed class AppEvent with _$AppEvent{
  const factory AppEvent.loadData() = _LoadData;
  const factory AppEvent.changeAppLanguage(Language? language) = _ChangeAppLanguage;
  const factory AppEvent.toggleAppTheme() = _ToggleAppTheme;
}