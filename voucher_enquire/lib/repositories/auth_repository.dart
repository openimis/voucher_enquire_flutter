import 'package:voucher_enquire/data/api_provider.dart';
import 'package:voucher_enquire/gql/mutations.dart';
import 'package:voucher_enquire/models/dto.dart';
import 'package:voucher_enquire/util/result.dart';

class AuthRepository {
  final ApiProvider _apiProvider;

  AuthRepository({required ApiProvider apiProvider})
      : _apiProvider = apiProvider;

  Future<Result<JWTResponse, Exception>> loginToken(
      String username, String password) async {
    var result = await _apiProvider.mutate(tokenAuthMutation,
        <String, String>{"username": username, "password": password});
    if (result.data != null) {
      try {
        return Result(data: JWTResponse.fromJson(result.data!['tokenAuth']));
      } on Exception catch (e) {
        return Result(error: e);
      }
    } else {
      return Result(error: result.exception!);
    }
  }

  Future<Result<JWTResponse, Exception>> refreshToken(
      String refreshToken) async {
    var result = await _apiProvider.mutate(
        refreshTokenMutation, <String, String>{"refreshToken": refreshToken});
    if (result.data != null) {
      try {
        return Result(
            data: JWTResponse.fromJson(result.data!['refreshToken']));
      } on Exception catch (e) {
        return Result(error: e);
      }
    } else {
      return Result(error: result.exception!);
    }
  }
}
