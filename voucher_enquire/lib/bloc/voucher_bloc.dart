import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voucher_enquire/repository/repository.dart';
import 'package:voucher_enquire/models/models.dart';
import 'package:voucher_enquire/util/util.dart';

sealed class VoucherEvent {}

class VoucherFetchEvent extends VoucherEvent {
  final String nationalId;

  VoucherFetchEvent({required this.nationalId});
}

class VoucherBackEvent extends VoucherEvent {}

class VoucherState {
  final VoucherStatus status;
  final Map<String, dynamic> props;

  VoucherState({required this.status, this.props = const {}});
}

enum VoucherStatus {
  waiting,
  fetching,
  ready;

  VoucherState toState({Map<String, dynamic> props = const {}}) {
    return VoucherState(status: this, props: props);
  }
}

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final Future<TokenRepository> tokenRepository;
  final Future<VoucherRepository> voucherRepository;

  VoucherBloc({required this.tokenRepository, required this.voucherRepository})
      : super(VoucherStatus.waiting.toState()) {
    on<VoucherFetchEvent>(_onVoucherFetchEvent);
    on<VoucherBackEvent>(_onVoucherBackEvent);
  }

  void _onVoucherFetchEvent(
      VoucherFetchEvent event, Emitter<VoucherState> emit) async {
    emit(VoucherStatus.fetching.toState());

    Result<VoucherResponse, Exception> result =
        await (await voucherRepository).fetchVoucher(event.nationalId);

    if (result.isError) {
      emit(VoucherStatus.waiting.toState(props: {"error": "fetchFailed"}));
    } else if (result.data!.worker == null) {
      emit(VoucherStatus.waiting.toState(props: {"error": "workerNotExists"}));
    } else {
      var worker = result.data!.worker;
      var voucher = result.data!.voucher;

      //check if voucher assigned to this worker
      voucher = voucher != null &&
              worker!.nationalId == voucher.worker.nationalId &&
              voucher.status == VoucherBusinessStatus.assigned
          ? voucher
          : null;

      emit(VoucherStatus.ready.toState(props: {
        "worker": result.data?.worker,
        "voucher": result.data?.voucher
      }));
    }
  }

  void _onVoucherBackEvent(
      VoucherBackEvent event, Emitter<VoucherState> emit) async {
    emit(VoucherStatus.waiting.toState());
  }
}
