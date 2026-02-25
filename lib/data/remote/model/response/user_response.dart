import 'package:json_annotation/json_annotation.dart';
import 'package:template_bloc/data/local/model/user_cache_model.dart';
import 'package:template_bloc/domain/entities/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  const UserResponse({required this.id, required this.username, required this.email});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'email')
  final String email;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  User toEntity() => User(id: id, username: username, email: email);

  UserCacheModel toCacheModel() => UserCacheModel(id: id, username: username, email: email);
}
