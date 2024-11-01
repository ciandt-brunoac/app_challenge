import 'package:app_challenge/common/data/interfaces/remote_graphql_datasource_interface.dart';
import 'package:app_challenge/dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService implements RemoteGraphQlDatasourceInterface {
  late GraphQLClient client;

  @override
  Future<void> init() async {
    final HttpLink httpLink = HttpLink(
      'https://api.github.com/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${Environments.personalAccessToken}',
      // OR
      // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );

    final Link link = authLink.concat(httpLink);

    client = GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
