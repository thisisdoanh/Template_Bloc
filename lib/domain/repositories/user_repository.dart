import 'package:template_bloc/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getProfile();
  Future<User> login({required String username, required String password});
  Future<void> logout();
}
