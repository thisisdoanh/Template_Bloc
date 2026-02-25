import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/presentation/base/base_bloc.dart';
import 'package:{{project_name}}/presentation/base/base_state.dart';
import 'package:{{project_name}}/presentation/base/page_status.dart';
import 'package:{{project_name}}/shared/common/error_converter.dart';

part '{{bloc_snake_case}}_bloc.freezed.dart';
part '{{bloc_snake_case}}_event.dart';
part '{{bloc_snake_case}}_state.dart';

@injectable
class {{bloc_pascal_case}}Bloc extends BaseBloc<{{bloc_pascal_case}}Event, {{bloc_pascal_case}}State> {
  {{bloc_pascal_case}}Bloc() : super(const {{bloc_pascal_case}}State()) {
    on<{{bloc_pascal_case}}Event>((event, emit) async {
        try {
          switch(event) {
            case _LoadData():
              _handleEventLoadData(emit, event);
              break;
          }
        } catch(e,s) {
            handleError(emit, ErrorConverter.convert(e, s));
        }
    });
  }

  Future<void> _handleEventLoadData(Emitter<{{bloc_pascal_case}}State> emit, _LoadData event) async {}
}