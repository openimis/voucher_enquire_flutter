import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voucher_enquire/ui/ui_parts.dart';
import 'package:voucher_enquire/ui/ui.dart';
import 'package:voucher_enquire/bloc/bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) => BlocBuilder<VoucherBloc, VoucherState>(
          builder: (context, voucherState) => Column(
            children: [
              Visibility(
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                visible: authState.status == AuthStatus.authenticated,
                child: const LogoutBar(),
              ),
              const SizedBox(height: 32),
              Visibility(
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                visible: voucherState.status == VoucherStatus.ready,
                child: const VoucherBackButton(),
              ),
              const SizedBox(height: 24),
              if (authState.status == AuthStatus.unauthenticated ||
                  authState.status == AuthStatus.authenticationInProgress) ...[
                const LoginForm()
              ],
              if (authState.status == AuthStatus.authenticated &&
                  (voucherState.status == VoucherStatus.waiting ||
                      voucherState.status == VoucherStatus.fetching)) ...[
                const VoucherForm()
              ],
              if (authState.status == AuthStatus.authenticated &&
                  voucherState.status == VoucherStatus.ready) ...[
                const VoucherPage()
              ],
            ],
          ),
        ),
      ),
    );
  }
}
