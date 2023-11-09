import 'package:flutter/material.dart';

class GenericFormConfirmButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String label;
  final void Function() onSave;
  final bool inProgress;

  const GenericFormConfirmButton(
      {super.key,
      required this.formKey,
      required this.label,
      required this.onSave,
      this.inProgress = false});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        if (!inProgress && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          onSave();
        }
      },
      child: Container(
          width: double.infinity,
          height: 58,
          decoration: ShapeDecoration(
            color: colorScheme.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          alignment: Alignment.center,
          child: inProgress
              ? CircularProgressIndicator(
                  color: colorScheme.onPrimary,
                )
              : Text(label,
                  style: textTheme.labelLarge!
                      .apply(color: colorScheme.onPrimary))),
    );
  }
}

class GenericFormTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final void Function(String?) onSaved;
  final bool obscureText;

  const GenericFormTextField(
      {super.key,
      required this.label,
      required this.onSaved,
      this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: textTheme.bodySmall!.apply(color: colorScheme.onSurface),
          contentPadding: const EdgeInsets.all(8)),
      style: textTheme.bodyMedium!.apply(color: colorScheme.onSurface),
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
