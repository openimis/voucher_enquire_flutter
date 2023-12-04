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

        if (result.data?['insurees']?['edges']?[0]?['node'] != null) {
          worker =
              Worker.fromJson(result.data!['insurees']['edges'][0]['node']);
        }
        if (result.data?['enquireWorker']?['edges']?[0]?['node'] != null) {
          voucher = Voucher.fromJson(
              result.data!['enquireWorker']['edges'][0]['node']);
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
