import 'package:path_provider/path_provider.dart';

class ConfigRepository {
  static const String _apiUrl = "http://imis-moldova.soldevelo.com/api/graphql";
  static const Map<String, String> _defaultHeaders = {
    "Accept": "application/json"
  };

  // All config fields should be async to require async flow
  Future<String> get apiUrl async => _apiUrl;

  Future<Map<String, String>> get defaultHttpHeaders async => _defaultHeaders;

  Future<String> get baseFilePath async =>
      (await getApplicationDocumentsDirectory()).path;
}
