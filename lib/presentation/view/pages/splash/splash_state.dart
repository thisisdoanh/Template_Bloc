part of 'splash_bloc.dart';

@freezed
abstract class SplashState extends BaseState with _$SplashState {
  const factory SplashState({
    @Default(PageStatus.Loaded) PageStatus pageStatus,
    String? pageErrorMessage,
  }) = _SplashState;

  const SplashState._({super.pageStatus = PageStatus.Loaded, super.pageErrorMessage});
}
