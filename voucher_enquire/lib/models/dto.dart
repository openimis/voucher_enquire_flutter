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
  @JsonKey(name: "chfId")
  final String nationalId;
  @JsonKey(name: "otherNames")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;

  const Worker({required this.nationalId, this.firstName, this.lastName});

  @override
  String toString() {
    return 'Worker{nationalId: $nationalId, firstName: $firstName, lastName: $lastName}';
  }

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}

@JsonEnum(valueField: 'status')
enum VoucherBusinessStatus {
  awaitingPayment("AWAITING_PAYMENT"),
  unassigned("UNASSIGNED"),
  assigned("ASSIGNED"),
  expired("EXPIRED"),
  canceled("CANCELED"),
  closed("CLOSED");

  final String status;

  const VoucherBusinessStatus(this.status);
}

@JsonSerializable()
class Employer {
  final String? code;
  @JsonKey(name: "tradeName")
  final String name;

  Employer({this.code, required this.name});

  @override
  String toString() {
    return 'Employer{code: $code, name: $name}';
  }

  factory Employer.fromJson(Map<String, dynamic> json) =>
      _$EmployerFromJson(json);

  Map<String, dynamic> toJson() => _$EmployerToJson(this);
}

@JsonSerializable()
class Voucher {
  @JsonKey(name: "policyholder")
  final Employer employer;
  @JsonKey(name: "insuree")
  final Worker worker;
  @JsonKey(name: "dateUpdatedAsDate")
  final String dateIssued;
  @JsonKey(name: "assignedDate")
  final String dateAssigned;
  final VoucherBusinessStatus status;

  Voucher(
      {required this.employer,
      required this.worker,
      required this.dateIssued,
      required this.dateAssigned,
      required this.status});

  @override
  String toString() {
    return 'Voucher{employer: $employer, worker: $worker, dateIssued: $dateIssued, dateAssigned: $dateAssigned, status: $status}';
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
