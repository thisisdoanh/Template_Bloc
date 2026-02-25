import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/domain/repositories/{{bloc_snake_case}}_repository.dart';

@Injectable(as: {{bloc_pascal_case}}Repository)
class {{bloc_pascal_case}}RepositoryImpl extends {{bloc_pascal_case}}Repository {
  {{bloc_pascal_case}}RepositoryImpl();
}