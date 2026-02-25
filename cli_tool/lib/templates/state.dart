part of '{{bloc_snake_case}}_bloc.dart';

@freezed
abstract class {{bloc_pascal_case}}State extends BaseState with _${{bloc_pascal_case}}State {
  const factory {{bloc_pascal_case}}State({
    @Default(PageStatus.Loaded) PageStatus pageStatus,
    String? pageErrorMessage,
  }) = _{{bloc_pascal_case}}State;

  const {{bloc_pascal_case}}State._({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}