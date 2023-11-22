import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voucher_enquire/bloc/bloc.dart';
import 'package:voucher_enquire/models/models.dart';
import 'package:voucher_enquire/ui/ui_parts.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var text = AppLocalizations.of(context);
    var voucherBloc = BlocProvider.of<VoucherBloc>(context);

    Worker worker = voucherBloc.state.props['worker']!;
    Voucher? voucher = voucherBloc.state.props['voucher'];

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 32),
          decoration: ShapeDecoration(
            color: colorScheme.surface,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoHeader(text: text.workerInfoLabel),
              const SizedBox(height: 32),
              InfoRow(
                label: text.nationalIdGridLabel,
                line: worker.nationalId,
              ),
              const SizedBox(height: 24),
              InfoRow(
                label: text.firstNameGridLabel,
                line: worker.firstName,
              ),
              const SizedBox(height: 24),
              InfoRow(
                label: text.lastNameGridLabel,
                line: worker.lastName,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 32),
          decoration: ShapeDecoration(
            color: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoHeader(text: text.voucherInfoLabel),
                  voucher != null
                      ? const ActiveStatusImage()
                      : const InactiveStatusImage()
                ],
              ),
              const SizedBox(height: 32),
              if (voucher != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoRow(
                      label: text.employerGridLabel,
                      line: voucher.employer,
                    ),
                    const SizedBox(height: 24),
                    InfoRow(
                      label: text.dateIssuedGridLabel,
                      line: voucher.dateIssued,
                    ),
                    const SizedBox(height: 24),
                    InfoRow(
                      label: text.dateAssignedGridLabel,
                      line: voucher.dateAssigned,
                    ),
                  ],
                ),
              if (voucher == null)
                Text(
                  text.noVouchers,
                  style: textTheme.bodyMedium!.apply(
                      fontStyle: FontStyle.italic,
                      color: colorScheme.onSurface),
                )
            ],
          ),
        ),
      ],
    );
  }
}

class InfoHeader extends StatelessWidget {
  final String text;

  const InfoHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return Text(
      text,
      style: textTheme.headlineMedium!.apply(color: colorScheme.onSurface),
    );
  }
}

class ActiveStatusImage extends StatelessWidget {
  const ActiveStatusImage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).extension<CustomColors>()!;
    var text = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: ShapeDecoration(
        color: colorScheme.active,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/check-line.png')),
          const SizedBox(width: 4),
          Text(
            text.activeLabel,
            style: textTheme.displaySmall!.apply(color: colorScheme.onActive),
          ),
        ],
      ),
    );
  }
}

class InactiveStatusImage extends StatelessWidget {
  const InactiveStatusImage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).extension<CustomColors>()!;
    var text = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: ShapeDecoration(
        color: colorScheme.inactive,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/close-line.png')),
          const SizedBox(width: 4),
          Text(
            text.inactiveLabel,
            style: textTheme.displaySmall!.apply(color: colorScheme.onInactive),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String line;

  const InfoRow({super.key, required this.label, required this.line});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 104,
          child: Text(
            label,
            style: textTheme.labelMedium!.apply(color: colorScheme.onSurface),
          ),
        ),
        Text(
          line,
          style: textTheme.bodyMedium!.apply(color: colorScheme.onSurface),
        )
      ],
    );
  }
}
