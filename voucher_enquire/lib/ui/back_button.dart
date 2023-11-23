import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voucher_enquire/bloc/bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VoucherBackButton extends StatelessWidget {
  const VoucherBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var text = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () {
        BlocProvider.of<VoucherBloc>(context).add(VoucherBackEvent());
      },
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/arrow-left-s-line.png'),
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            Text(
              text.backLabel,
              style: textTheme.displayLarge!
                  .apply(color: colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
