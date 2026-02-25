import 'package:json_annotation/json_annotation.dart';

part 'test_response.g.dart';

@JsonSerializable()
class TestResponse {
  TestResponse({
    required this.id,
    required this.title,
  });

  factory TestResponse.fromJson(Map<String, dynamic> json) =>
      _$TestResponseFromJson(json);

  final int id;
  final String title;

  Map<String, dynamic> toJson() => _$TestResponseToJson(this);
}
