import 'package:voucher_enquire/data/api_provider.dart';
import 'package:voucher_enquire/gql/queries.dart';
import 'package:voucher_enquire/models/models.dart';
import 'package:voucher_enquire/util/util.dart';

class VoucherRepository {
  final ApiProvider _apiProvider;

  VoucherRepository({required ApiProvider apiProvider})
      : _apiProvider = apiProvider;

  Future<Result<VoucherResponse, Exception>> fetchVoucher(
      String nationalId) async {
    var result = await _apiProvider
        .query(workerEnquire, <String, String>{"nationalId": nationalId});
    if (result.data != null) {
      try {
        Worker? worker;
        Voucher? voucher;

        var insureeResult = getFirstQueryResult(result, 'insurees');
        if (insureeResult != null) {
          worker = Worker.fromJson(insureeResult);
        }
        var voucherResult = getFirstQueryResult(result, 'enquireWorker');
        if (voucherResult != null) {
          voucher = Voucher.fromJson(voucherResult);
        }

        return Result(data: VoucherResponse(worker: worker, voucher: voucher));
      } on Exception catch (e) {
        return Result(error: e);
      }
    } else {
      return Result(error: result.exception!);
    }
  }
}
