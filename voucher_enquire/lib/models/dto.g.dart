// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JWTPayload _$JWTPayloadFromJson(Map<String, dynamic> json) => JWTPayload(
      username: json['username'] as String,
      exp: json['exp'] as int,
      origIat: json['origIat'] as int,
    );

Map<String, dynamic> _$JWTPayloadToJson(JWTPayload instance) =>
    <String, dynamic>{
      'username': instance.username,
      'exp': instance.exp,
      'origIat': instance.origIat,
    };

JWTResponse _$JWTResponseFromJson(Map<String, dynamic> json) => JWTResponse(
      token: json['token'] as String,
      payload: JWTPayload.fromJson(json['payload'] as Map<String, dynamic>),
      refreshToken: json['refreshToken'] as String,
      refreshExpiresIn: json['refreshExpiresIn'] as int,
    );

Map<String, dynamic> _$JWTResponseToJson(JWTResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'payload': instance.payload,
      'refreshToken': instance.refreshToken,
      'refreshExpiresIn': instance.refreshExpiresIn,
    };
