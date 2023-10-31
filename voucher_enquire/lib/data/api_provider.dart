import 'package:graphql_flutter/graphql_flutter.dart';

class ApiProvider {
  final GraphQLClient _gqlClient;

  ApiProvider({required GraphQLClient graphQLClient})
      : _gqlClient = graphQLClient;

  Future<QueryResult> mutate(String mutation, Map<String, dynamic> args) async {
    final MutationOptions options =
        MutationOptions(document: gql(mutation), variables: args);

    return await _gqlClient.mutate(options);
  }

  Future<QueryResult> query(String query, Map<String, dynamic> args) async {
    final QueryOptions options =
        QueryOptions(document: gql(query), variables: args);

    return await _gqlClient.query(options);
  }
}
