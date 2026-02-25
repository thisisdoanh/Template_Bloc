import 'package:json_annotation/json_annotation.dart';
import 'package:template_bloc/data/remote/model/response/user_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.id,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @JsonKey(name: 'accessToken')
  final String accessToken;

  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'firstName')
  final String? firstName;

  @JsonKey(name: 'lastName')
  final String? lastName;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'image')
  final String? image;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  UserResponse get user => UserResponse(
        id: id.toString(),
        username: username,
        email: email,
      );
}
