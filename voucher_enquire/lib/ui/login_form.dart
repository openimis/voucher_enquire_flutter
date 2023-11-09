import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voucher_enquire/bloc/auth_bloc.dart';

import 'form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var text = AppLocalizations.of(context);
    var authBloc = BlocProvider.of<AuthBloc>(context);

    String? username;
    String? password;

    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: ShapeDecoration(
          color: colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/MMPS_logo.png'),
                width: 160,
                height: 49,
              ),
              const SizedBox(height: 32),
              Text(AppLocalizations.of(context).loginFormLabel,
                  style: textTheme.headlineSmall!
                      .apply(color: colorScheme.onSurface)),
              const SizedBox(height: 32),
              GenericFormTextField(
                label: text.usernameLabel,
                validator: (value) => (value == null || value.isEmpty)
                    ? text.enterUsername
                    : null,
                onSaved: (value) => username = value,
              ),
              const SizedBox(height: 16),
              GenericFormTextField(
                label: text.passwordLabel,
                validator: (value) => (value == null || value.isEmpty)
                    ? text.enterPassword
                    : null,
                onSaved: (value) => password = value,
                obscureText: true,
              ),
              ...(state.props['authFailed'] ?? false)
                  ? [
                      const SizedBox(height: 16),
                      Text(AppLocalizations.of(context).loginFailed,
                          style: textTheme.bodyMedium!
                              .apply(color: colorScheme.error))
                    ]
                  : [],
              const SizedBox(height: 24),
              GenericFormConfirmButton(
                formKey: _formKey,
                label: text.confirmButtonLabel,
                onSave: () => authBloc.add(
                    AuthLoginEvent(username: username!, password: password!)),
                inProgress: state.status == AuthStatus.authenticationInProgress,
              )
            ],
          ),
        ),
      ),
    );
  }
}
