import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voucher_enquire/bloc/bloc.dart';
import 'package:voucher_enquire/data/api_provider.dart';
import 'package:voucher_enquire/data/file_provider.dart';
import 'package:voucher_enquire/gql/client.dart';
import 'package:voucher_enquire/repository/repository.dart';
import 'package:voucher_enquire/ui/ui.dart';
import 'package:voucher_enquire/ui/ui_parts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runApp(MaterialApp(
    // Translations not loaded at this point
    title: "Voucher Enquire",
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: mainTheme,
    home: const Material(child: Global(child: MainPage())),
  ));
}

class Global extends StatefulWidget {
  final Widget child;

  const Global({super.key, required this.child});

  @override
  State<Global> createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  late Future<ApiProvider> apiProvider;

  late Future<ConfigRepository> configRepository;
  late Future<AuthRepository> authRepository;
  late Future<TokenRepository> tokenRepository;
  late Future<VoucherRepository> voucherRepository;

  @override
  void initState() {
    super.initState();
    configRepository = Future(() => ConfigRepository());
    apiProvider = Future(() async => ApiProvider(
        gqlClient: buildGqlClient(
            endpoint: await (await configRepository).apiUrl,
            headers: await (await configRepository).defaultHttpHeaders)));
    authRepository =
        Future(() async => AuthRepository(apiProvider: await apiProvider));
    tokenRepository = Future(() async => TokenRepository(
        fileProvider: FileProvider(
            basePath: await (await configRepository).baseFilePath)));
    voucherRepository =
        Future(() async => VoucherRepository(apiProvider: await apiProvider));
  }

  void clearVoucher() {}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                authRepository: authRepository,
                tokenRepository: tokenRepository)
              ..add(AuthCheckTokenEvent())),
        BlocProvider<VoucherBloc>(
            create: (context) => VoucherBloc(
                tokenRepository: tokenRepository,
                voucherRepository: voucherRepository)),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        // Rebuild gql client after auth status update to add or remove authentication header
        // Clear current voucher after logout
        listenWhen: (previousState, currentState) =>
            currentState.status == AuthStatus.authenticated ||
            currentState.status == AuthStatus.unauthenticated,
        listener: (BuildContext context, AuthState state) async {
          switch (state.status) {
            case AuthStatus.authenticated:
              (await apiProvider).gqlClient = buildGqlClient(
                  endpoint: await (await configRepository).apiUrl,
                  headers: await (await configRepository).defaultHttpHeaders,
                  token: state.props['token']);
            case AuthStatus.unauthenticated:
              (await apiProvider).gqlClient = buildGqlClient(
                  endpoint: await (await configRepository).apiUrl,
                  headers: await (await configRepository).defaultHttpHeaders);

              //Check required in async function
              if (context.mounted) {
                var voucherBloc = BlocProvider.of<VoucherBloc>(context);
                if (voucherBloc.state.status == VoucherStatus.ready) {
                  voucherBloc.add(VoucherBackEvent());
                }
              }
            default:
          }
        },
        child: widget.child,
      ),
    );
  }
}
