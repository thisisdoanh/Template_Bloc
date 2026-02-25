import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:template_bloc/domain/usecases/login_use_case.dart';
import 'package:template_bloc/presentation/base/base_bloc.dart';
import 'package:template_bloc/presentation/base/base_state.dart';
import 'package:template_bloc/presentation/base/page_status.dart';
import 'package:template_bloc/shared/common/error_converter.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc(this._loginUseCase) : super(const SplashState()) {
    on<SplashEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            await _loginUseCase.call(
              params: const LoginParams(username: 'emilys', password: 'emilyspass'),
            );

            break;
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }

  final LoginUseCase _loginUseCase;
}
