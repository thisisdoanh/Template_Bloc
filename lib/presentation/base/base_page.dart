import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:template_bloc/di/di.dart';
import 'package:template_bloc/presentation/base/base_bloc.dart';
import 'package:template_bloc/presentation/base/base_state.dart';
import 'package:template_bloc/presentation/base/page_status.dart';

abstract class BasePage<B extends BaseBloc<E, S>, E, S extends BaseState>
    extends StatefulWidget
    implements AutoRouteWrapper  {
  const BasePage({super.key, this.screenName, this.isSingletonBloc = false});
  final String? screenName;

  final bool isSingletonBloc;

  Widget builder(BuildContext context);

  void onInitState(BuildContext context) {}

  void onDispose(BuildContext context) {}

  void onResume(BuildContext context) {}

  void onPause(BuildContext context) {}

  void onBuilderComplete(BuildContext context) {}

  B createBloc() => getIt<B>();

  @override
  Widget wrappedRoute(BuildContext context) {
    final B bloc = createBloc();
    if (isSingletonBloc) {
      return BlocProvider.value(value: bloc, child: this);
    }
    return BlocProvider<B>(create: (_) => bloc, child: this);
  }

  @override
  State<BasePage> createState() => _BasePageState<B, E, S>();
}

class _BasePageState<B extends BaseBloc<E, S>, E, S extends BaseState>
    extends State<BasePage> with WidgetsBindingObserver {
  late VoidCallback onBuilderComplete;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    onBuilderComplete = () {
      widget.onBuilderComplete(context);
    };

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      widget.onInitState(context);
    });
    super.initState();
  }


  @override
  void dispose() {
    widget.onDispose(context);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!mounted) {
      return;
    }

    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResume(context);
      case AppLifecycleState.paused:
        widget.onPause(context);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: (previous, current) =>
          previous.pageStatus != current.pageStatus,
      builder: (context, state) {
        switch (state.pageStatus) {
          case PageStatus.Uninitialized:
            return const Center(child: CircularProgressIndicator());
          case PageStatus.Loaded:
            final builder = widget.builder(context);
            onBuilderComplete.call();
            return builder;
          case PageStatus.Error:
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(state.pageErrorMessage ?? 'Error!!!'),
              ),
            );
            return const Center(child: Text('Error!!!'));
        }
      },
    );
  }
}
