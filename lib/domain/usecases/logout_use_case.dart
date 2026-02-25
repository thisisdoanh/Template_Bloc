import 'package:injectable/injectable.dart';
import 'package:template_bloc/domain/repositories/user_repository.dart';
import 'package:template_bloc/domain/usecases/use_case.dart';

@injectable
class LogoutUseCase implements UseCase<void, NoParams> {
  LogoutUseCase(this._repository);

  final UserRepository _repository;

  @override
  Future<void> call({required NoParams params}) => _repository.logout();
}
