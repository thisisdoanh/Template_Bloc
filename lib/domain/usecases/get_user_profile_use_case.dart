import 'package:injectable/injectable.dart';
import 'package:template_bloc/domain/entities/user.dart';
import 'package:template_bloc/domain/repositories/user_repository.dart';
import 'package:template_bloc/domain/usecases/use_case.dart';

@injectable
class GetUserProfileUseCase implements UseCase<User, NoParams> {
  GetUserProfileUseCase(this._repository);

  final UserRepository _repository;

  @override
  Future<User> call({required NoParams params}) => _repository.getProfile();
}
