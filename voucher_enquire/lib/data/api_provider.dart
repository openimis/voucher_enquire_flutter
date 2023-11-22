import 'package:graphql_flutter/graphql_flutter.dart';

class ApiProvider {
  GraphQLClient gqlClient;

  ApiProvider({required this.gqlClient});

  Future<QueryResult> mutate(String mutation, Map<String, dynamic> args) async {
    final MutationOptions options =
        MutationOptions(document: gql(mutation), variables: args);

    return await gqlClient.mutate(options);
  }

  Future<QueryResult> query(String query, Map<String, dynamic> args) async {
    final QueryOptions options =
        QueryOptions(document: gql(query), variables: args);

    return await gqlClient.query(options);
  }
}
