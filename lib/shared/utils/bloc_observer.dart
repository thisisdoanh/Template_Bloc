import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc/shared/utils/app_log.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    AppLog.debug('${bloc.runtimeType} Created');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    AppLog.debug('${bloc.runtimeType}\nOn Event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    AppLog.debug('${bloc.runtimeType} Close');
    super.onClose(bloc);
  }

  String _shorten(Object state, {int maxLength = 200}) {
    final text = state.toString();
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...'; // cắt kèm dấu ...
  }
}
