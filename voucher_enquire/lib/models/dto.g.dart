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

Worker _$WorkerFromJson(Map<String, dynamic> json) => Worker(
      nationalId: json['nationalId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$WorkerToJson(Worker instance) => <String, dynamic>{
      'nationalId': instance.nationalId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      employer: json['employer'] as String,
      dateIssued: json['dateIssued'] as String,
      dateAssigned: json['dateAssigned'] as String,
    );

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'employer': instance.employer,
      'dateIssued': instance.dateIssued,
      'dateAssigned': instance.dateAssigned,
    };

VoucherResponse _$VoucherResponseFromJson(Map<String, dynamic> json) =>
    VoucherResponse(
      worker: json['worker'] == null
          ? null
          : Worker.fromJson(json['worker'] as Map<String, dynamic>),
      voucher: json['voucher'] == null
          ? null
          : Voucher.fromJson(json['voucher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VoucherResponseToJson(VoucherResponse instance) =>
    <String, dynamic>{
      'worker': instance.worker,
      'voucher': instance.voucher,
    };
