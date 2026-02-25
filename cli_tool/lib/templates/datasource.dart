import 'package:injectable/injectable.dart';

import 'package:{{project_name}}/data/remote/services/services/api_service.dart';

@Injectable(as: {{bloc_pascal_case}}RemoteDataSource)
class {{bloc_pascal_case}}RemoteDataSourceImpl implements {{bloc_pascal_case}}RemoteDataSource {
  {{bloc_pascal_case}}RemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;
}

abstract class {{bloc_pascal_case}}RemoteDataSource {
}