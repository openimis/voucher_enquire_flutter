import 'package:voucher_enquire/data/file_provider.dart';
import 'package:path/path.dart' as path;

import '../util/util.dart';

class TokenRepository {
  final tokenFileName = path.join('auth', 'token.txt');
  final refreshTokenFileName = path.join('auth', 'refreshToken.txt');

  final FileProvider fileProvider;

  TokenRepository({required this.fileProvider});

  Future<Result<String, Exception>> readToken() async {
    return _readFile(tokenFileName);
  }

  Future<Result<String, Exception>> readRefreshToken() {
    return _readFile(refreshTokenFileName);
  }

  Future<Result<void, Exception>> writeToken(String token) {
    return _writeFile(tokenFileName, token);
  }

  Future<Result<void, Exception>> writeRefreshToken(String token) {
    return _writeFile(refreshTokenFileName, token);
  }

  Future<Result<void, Exception>> _writeFile(
      String filename, String content) async {
    try {
      fileProvider.write(filename, content);
      return Result();
    } on Exception catch (e) {
      return Result(error: e);
    }
  }

  Future<Result<String, Exception>> _readFile(String filename) async {
    try {
      String token = await fileProvider.exists(filename)
          ? await fileProvider.read(filename)
          : "";
      return Result(data: token);
    } on Exception catch (e) {
      return Result(error: e);
    }
  }
}
