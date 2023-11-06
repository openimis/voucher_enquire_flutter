import 'package:json_annotation/json_annotation.dart';

// Generated part of the file
part 'dto.g.dart';

@JsonSerializable()
class JWTPayload {
  final String username;
  final int exp;
  final int origIat;

  JWTPayload(
      {required this.username, required this.exp, required this.origIat});

  @override
  String toString() {
    return 'JWTPayload{username: $username, exp: $exp, origIat: $origIat}';
  }

  factory JWTPayload.fromJson(Map<String, dynamic> json) =>
      _$JWTPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$JWTPayloadToJson(this);
}

@JsonSerializable()
class JWTResponse {
  final String token;
  final JWTPayload payload;
  final String refreshToken;
  final int refreshExpiresIn;

  JWTResponse(
      {required this.token,
      required this.payload,
      required this.refreshToken,
      required this.refreshExpiresIn});

  @override
  String toString() {
    return 'JWTResponse{token: $token, payload: $payload, refreshToken: $refreshToken, refreshExpiresIn: $refreshExpiresIn}';
  }

  factory JWTResponse.fromJson(Map<String, dynamic> json) =>
      _$JWTResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JWTResponseToJson(this);
}
