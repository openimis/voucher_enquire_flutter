import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voucher_enquire/repository/repository.dart';

import '../models/dto.dart';
import '../util/result.dart';

sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  AuthLoginEvent({required this.username, required this.password});
}

class AuthLogoutEvent extends AuthEvent {}

class AuthCheckTokenEvent extends AuthEvent {}

class AuthState {
  final AuthStatus status;
  final Map<String, dynamic> props;

  AuthState({required this.status, this.props = const {}});
}

enum AuthStatus {
  uninitialized,
  authenticated,
  authenticationInProgress,
  unauthenticated;

  AuthState toState({Map<String, dynamic> props = const {}}) {
    return AuthState(status: this, props: props);
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Future<TokenRepository> tokenRepository;
  final Future<AuthRepository> authRepository;

  AuthBloc({required this.tokenRepository, required this.authRepository})
      : super(AuthStatus.uninitialized.toState()) {
    on<AuthLoginEvent>(_onAuthLoginEvent);
    on<AuthLogoutEvent>(_onAuthLogoutEvent);
    on<AuthCheckTokenEvent>(_onAuthCheckTokenEvent);
  }

  void _onAuthLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthStatus.authenticationInProgress.toState());
    Result<JWTResponse, Exception> response =
        await (await authRepository).loginToken(event.username, event.password);

    if (response.isError) {
      emit(AuthStatus.unauthenticated.toState(props: {"authFailed": true}));
      return;
    }

    var resultToken =
        await (await tokenRepository).writeToken(response.data!.token);
    var resultRefreshToken = await (await tokenRepository)
        .writeRefreshToken(response.data!.refreshToken);

    if (resultToken.isOk && resultRefreshToken.isOk) {
      emit(AuthStatus.authenticated.toState());
    } else {
      emit(AuthStatus.unauthenticated.toState(props: {"authFailed": true}));
    }
  }

  void _onAuthLogoutEvent(
      AuthLogoutEvent event, Emitter<AuthState> emit) async {
    if (await _clearToken()) {
      emit(AuthStatus.unauthenticated.toState());
    }
  }

  void _onAuthCheckTokenEvent(
      AuthCheckTokenEvent event, Emitter<AuthState> emit) async {
    var result = await (await tokenRepository).readToken();

    if (result.isError || result.data == "") {
      emit(AuthStatus.unauthenticated.toState());
      return;
    }

    if (await _isTokenValid(result.data!)) {
      emit(AuthStatus.authenticated.toState());
    } else {
      await _clearToken();
      emit(AuthStatus.unauthenticated.toState());
    }
  }

  Future<bool> _clearToken() async {
    var resultToken = await (await tokenRepository).writeToken("");
    var resultRefreshToken =
        await (await tokenRepository).writeRefreshToken("");

    return resultToken.isOk && resultRefreshToken.isOk;
  }

  Future<bool> _isTokenValid(String token) async {
    // Format is header.payload.sig
    List<String> sections = token.split('.');
    if (sections.length != 3) return false;

    // Valid payload (base64 of json string)
    late JWTPayload payload;
    try {
      var jsonString =
          utf8.decode(base64.decode(base64.normalize(sections[1])));
      payload = JWTPayload.fromJson(json.decode(jsonString));
    } catch (e) {
      return false;
    }

    // Token not expired
    var currentSecondsFromEpoch =
        (DateTime.now().millisecondsSinceEpoch / 1e3).floor();
    if (payload.exp < currentSecondsFromEpoch) return false;

    return true;
  }
}
