import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voucher_enquire/bloc/bloc.dart';

class LogoutBar extends StatelessWidget {
  const LogoutBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 36,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OpenIMISLogo(),
          LogoutButton(),
        ],
      ),
    );
  }
}

class OpenIMISLogo extends StatelessWidget {
  const OpenIMISLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Opacity(
        opacity: 0.85,
        child: Image(
          image: AssetImage('assets/openIMIS_logo.png'),
          width: 121,
          height: 36,
        ));
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          AppLocalizations.of(context).logoutButtonLabel,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }
}
