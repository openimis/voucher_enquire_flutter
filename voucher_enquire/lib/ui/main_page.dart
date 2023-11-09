import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voucher_enquire/data/file_provider.dart';
import 'package:voucher_enquire/ui/background.dart';
import 'package:voucher_enquire/ui/login_form.dart';
import 'package:voucher_enquire/ui/logout_bar.dart';

import '../bloc/auth_bloc.dart';
import '../data/api_provider.dart';
import '../gql/client.dart';
import '../repositories/auth_repository.dart';
import '../repositories/config_repository.dart';
import '../repositories/token_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<ConfigRepository> configRepository;
  late Future<AuthRepository> authRepository;
  late Future<TokenRepository> tokenRepository;

  @override
  void initState() {
    super.initState();
    configRepository = Future(() => ConfigRepository());
    authRepository = Future(() async => AuthRepository(
        apiProvider: ApiProvider(
            graphQLClient: buildGqlClient(
                endpoint: await (await configRepository).apiUrl,
                headers: await (await configRepository).defaultHttpHeaders))));
    tokenRepository = Future(() async => TokenRepository(
        fileProvider: FileProvider(
            basePath: await (await configRepository).baseFilePath)));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Background(
        child: BlocProvider(
          create: (context) => AuthBloc(
              authRepository: authRepository, tokenRepository: tokenRepository)
            ..add(AuthCheckTokenEvent()),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  Visibility(
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    visible: state.status == AuthStatus.authenticated,
                    child: const LogoutBar(),
                  ),
                  const SizedBox(height: 88),
                  if (state.status == AuthStatus.unauthenticated ||
                      state.status == AuthStatus.authenticationInProgress) ...[
                    const LoginForm()
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
