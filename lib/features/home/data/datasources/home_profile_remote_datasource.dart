import 'dart:developer';

import 'package:app_challenge/core/config/graphql_service.dart';
import 'package:app_challenge/features/home/data/datasources/interfaces/home_profile_remote_datasource_interface.dart';
import 'package:app_challenge/features/home/data/models/profile_model.dart';
import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeProfileRemoteDatasource
    implements HomeProfileRemoteDatasourceInterface {
  final GraphQlService _client;

  HomeProfileRemoteDatasource({
    required GraphQlService client,
  }) : _client = client;

  @override
  Future<ProfileEntity> getHomeProfile() async {
    const String query = '''
      query {
        viewer {
          name
          login
          avatarUrl
          bio
          repositories(last: 10, orderBy: {field: CREATED_AT, direction: DESC}) {
            nodes {
              name
              description
              url
            }
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final result = await _client.client.query(options);

    log(result.data.toString());

    return ProfileModel.fromJson(result.data ?? {});
  }
}
