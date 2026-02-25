import 'package:hive_ce/hive.dart';
import 'package:template_bloc/domain/entities/user.dart';

part 'user_cache_model.g.dart';

@HiveType(typeId: 0)
class UserCacheModel {
  UserCacheModel({
    required this.id,
    required this.username,
    required this.email,
  });

  factory UserCacheModel.fromEntity(User user) => UserCacheModel(
        id: user.id,
        username: user.username,
        email: user.email,
      );

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  User toEntity() => User(id: id, username: username, email: email);
}
