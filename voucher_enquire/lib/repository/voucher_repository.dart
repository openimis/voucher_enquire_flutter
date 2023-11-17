import '../data/api_provider.dart';
import '../models/dto.dart';
import '../util/result.dart';

class VoucherRepository {
  final ApiProvider _apiProvider;

  VoucherRepository({required ApiProvider apiProvider})
      : _apiProvider = apiProvider;

  Future<Result<VoucherResponse, Exception>> fetchVoucher(
      String nationalId) async {
    // TODO integrate with openIMIS backend
    // var result = await _apiProvider
    //     .query(voucherQuery, <String, String>{"nationalId": nationalId});
    var worker = !nationalId.startsWith("0")
        ? Worker(
            nationalId: nationalId,
            firstName: "John",
            lastName: "Doe",
          )
        : null;

    var voucher = !nationalId.startsWith("0") && !nationalId.startsWith("1")
        ? Voucher(
            employer: "Company ltd.",
            dateIssued: "1970-01-01",
            dateAssigned: "1970-01-02",
          )
        : null;

    return Future.delayed(const Duration(milliseconds: 500),
        () => Result(data: VoucherResponse(worker: worker, voucher: voucher)));
  }
}
