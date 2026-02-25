import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc/presentation/base/base_state.dart';
import 'package:template_bloc/shared/common/error_handler.dart';
import 'package:template_bloc/shared/utils/alert.dart';

abstract class BaseBloc<V, S extends BaseState> extends Bloc<V, S> {
  BaseBloc(super.initialState);

  Future<void> handleError(Emitter<S> emit, Object error) async => ErrorHandler.handle(error);

  void showLoading() {
    AppAlertDialog.show(
      type: AppAlertType.loading,
      barrierDismissible: false,
    );
  }

  void hideLoading() {
    AppAlertDialog.hide();
  }
}
