import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:{{project_name}}/presentation/base/base_page.dart';
import 'package:{{project_name}}/presentation/view/pages/{{bloc_snake_case}}/{{bloc_snake_case}}_bloc.dart';

@RoutePage()
class {{bloc_pascal_case}}Page extends BasePage<{{bloc_pascal_case}}Bloc, {{bloc_pascal_case}}Event, {{bloc_pascal_case}}State> {
  const {{bloc_pascal_case}}Page({super.key}) : super(screenName: "{{bloc_pascal_case}}Page");

  @override
  void onInitState(BuildContext context) {
    context.read<{{bloc_pascal_case}}Bloc>().add(const {{bloc_pascal_case}}Event.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    return const SizedBox();
  }
}