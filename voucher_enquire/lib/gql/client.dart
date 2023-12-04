import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLClient buildGqlClient(
    {required String endpoint,
    required Map<String, String> headers,
    String? token}) {
  Link link = HttpLink(endpoint, defaultHeaders: headers);
  if (token != null) {
    link = AuthLink(getToken: () async => 'Bearer $token').concat(link);
  }

  return GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}
