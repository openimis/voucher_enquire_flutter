import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voucher_enquire/ui/ui_parts.dart';
import 'package:voucher_enquire/bloc/bloc.dart';

class VoucherForm extends StatefulWidget {
  const VoucherForm({super.key});

  @override
  State<VoucherForm> createState() => _VoucherFormState();
}

class _VoucherFormState extends State<VoucherForm> {
  final _formKey = GlobalKey<FormState>();

  String getFetchError(BuildContext context, String key) {
    var text = AppLocalizations.of(context);
    return switch (key) {
      "workerNotExists" => text.workerNotExists,
      _ => text.voucherFetchFailed
    };
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var text = AppLocalizations.of(context);
    var voucherBloc = BlocProvider.of<VoucherBloc>(context);

    String? nationalId;

    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: ShapeDecoration(
          color: colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: BlocBuilder<VoucherBloc, VoucherState>(
          builder: (context, state) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).voucherFormLabel,
                style: textTheme.headlineMedium!
                    .apply(color: colorScheme.onSurface),
              ),
              const SizedBox(height: 32),
              GenericFormTextField(
                label: text.nationalIdLabel,
                validator: (value) => (value == null || value.isEmpty)
                    ? text.enterNationalId
                    : null,
                onSaved: (value) => nationalId = value,
              ),
              const SizedBox(height: 16),
              if (state.props['error'] != null) ...[
                const SizedBox(height: 16),
                Text(
                  getFetchError(context, state.props['error']),
                  style: textTheme.bodyMedium!.apply(color: colorScheme.error),
                )
              ],
              const SizedBox(height: 24),
              GenericFormConfirmButton(
                formKey: _formKey,
                label: text.confirmButtonLabel,
                onSave: () =>
                    voucherBloc.add(VoucherFetchEvent(nationalId: nationalId!)),
                inProgress: state.status == VoucherStatus.fetching,
              )
            ],
          ),
        ),
      ),
    );
  }
}
