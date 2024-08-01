// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JWTPayload _$JWTPayloadFromJson(Map<String, dynamic> json) => JWTPayload(
      username: json['username'] as String,
      exp: (json['exp'] as num).toInt(),
      origIat: (json['origIat'] as num).toInt(),
    );

Map<String, dynamic> _$JWTPayloadToJson(JWTPayload instance) =>
    <String, dynamic>{
      'username': instance.username,
      'exp': instance.exp,
      'origIat': instance.origIat,
    };

JWTResponse _$JWTResponseFromJson(Map<String, dynamic> json) => JWTResponse(
      token: json['token'] as String,
    );

Map<String, dynamic> _$JWTResponseToJson(JWTResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      photoBase64: json['photo'] as String?,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'photo': instance.photoBase64,
    };

Worker _$WorkerFromJson(Map<String, dynamic> json) => Worker(
      nationalId: json['chfId'] as String,
      firstName: json['otherNames'] as String?,
      lastName: json['lastName'] as String?,
      photo: json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkerToJson(Worker instance) => <String, dynamic>{
      'chfId': instance.nationalId,
      'otherNames': instance.firstName,
      'lastName': instance.lastName,
      'photo': instance.photo,
    };

Employer _$EmployerFromJson(Map<String, dynamic> json) => Employer(
      code: json['code'] as String?,
      name: json['tradeName'] as String,
    );

Map<String, dynamic> _$EmployerToJson(Employer instance) => <String, dynamic>{
      'code': instance.code,
      'tradeName': instance.name,
    };

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      employer: Employer.fromJson(json['policyholder'] as Map<String, dynamic>),
      worker: Worker.fromJson(json['insuree'] as Map<String, dynamic>),
      dateIssued: json['dateUpdatedAsDate'] as String,
      dateAssigned: json['assignedDate'] as String,
      status: $enumDecode(_$VoucherBusinessStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'policyholder': instance.employer,
      'insuree': instance.worker,
      'dateUpdatedAsDate': instance.dateIssued,
      'assignedDate': instance.dateAssigned,
      'status': _$VoucherBusinessStatusEnumMap[instance.status]!,
    };

const _$VoucherBusinessStatusEnumMap = {
  VoucherBusinessStatus.awaitingPayment: 'AWAITING_PAYMENT',
  VoucherBusinessStatus.unassigned: 'UNASSIGNED',
  VoucherBusinessStatus.assigned: 'ASSIGNED',
  VoucherBusinessStatus.expired: 'EXPIRED',
  VoucherBusinessStatus.canceled: 'CANCELED',
  VoucherBusinessStatus.closed: 'CLOSED',
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
