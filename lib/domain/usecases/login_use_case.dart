import 'package:injectable/injectable.dart';
import 'package:template_bloc/domain/entities/user.dart';
import 'package:template_bloc/domain/repositories/user_repository.dart';
import 'package:template_bloc/domain/usecases/use_case.dart';

class LoginParams {
  const LoginParams({required this.username, required this.password});

  final String username;
  final String password;
}

@injectable
class LoginUseCase implements UseCase<User, LoginParams> {
  LoginUseCase(this._repository);

  final UserRepository _repository;

  @override
  Future<User> call({required LoginParams params}) =>
      _repository.login(username: params.username, password: params.password);
}
