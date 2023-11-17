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

@JsonSerializable()
class Worker {
  final String nationalId;
  final String firstName;
  final String lastName;

  const Worker({required this.nationalId, required this.firstName, required this.lastName});


  @override
  String toString() {
    return 'Worker{nationalId: $nationalId, firstName: $firstName, lastName: $lastName}';
  }

  factory Worker.fromJson(Map<String, dynamic> json) =>
      _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}

@JsonSerializable()
class Voucher {
  final String employer;
  final String dateIssued;
  final String dateAssigned;

  Voucher({required this.employer, required this.dateIssued, required this.dateAssigned});

  @override
  String toString() {
    return 'Voucher{employer: $employer, dateIssued: $dateIssued, dateAssigned: $dateAssigned}';
  }

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);
}

@JsonSerializable()
class VoucherResponse {
  final Worker? worker;
  final Voucher? voucher;

  VoucherResponse({this.worker, this.voucher});

  @override
  String toString() {
    return 'VoucherResponse{worker: $worker, voucher: $voucher}';
  }

  factory VoucherResponse.fromJson(Map<String, dynamic> json) =>
      _$VoucherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherResponseToJson(this);

}
