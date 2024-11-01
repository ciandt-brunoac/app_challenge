import 'package:app_challenge/core/config/graphql_service.dart';
import 'package:app_challenge/features/home/data/datasources/home_profile_remote_datasource.dart';
import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'home_profile_remote_datasource_test.mocks.dart';

@GenerateMocks([GraphQlService, GraphQLClient])
void main() {
  late MockGraphQlService mockGraphQlService;
  late MockGraphQLClient mockGraphQLClient;
  late HomeProfileRemoteDatasource datasource;

  setUp(() {
    mockGraphQlService = MockGraphQlService();
    mockGraphQLClient = MockGraphQLClient();
    datasource = HomeProfileRemoteDatasource(client: mockGraphQlService);

    when(mockGraphQlService.client).thenReturn(mockGraphQLClient);
  });

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

  final Map<String, dynamic> mockData = {
    'viewer': {
      'name': 'Test User',
      'login': 'testuser',
      'avatarUrl': 'https://example.com/avatar.png',
      'bio': 'Software Developer',
      'repositories': {
        'nodes': [
          {
            'name': 'Repo1',
            'description': 'Description1',
            'url': 'https://example.com/repo1'
          },
          {
            'name': 'Repo2',
            'description': 'Description2',
            'url': 'https://example.com/repo2'
          }
        ]
      }
    }
  };

  final QueryOptions options = QueryOptions(
    document: gql(query),
  );

  group('HomeProfileRemoteDatasource Tests', () {
    test('should return a valid GraphQLClient', () {
      final client = mockGraphQlService.client;
      expect(client, isA<GraphQLClient>());
    });

    test('should return ProfileEntity when the query is successful', () async {
      final QueryResult mockQueryResult = QueryResult(
        data: mockData,
        source: QueryResultSource.network,
        options: options,
      );

      when(mockGraphQLClient.query(options))
          .thenAnswer((_) async => mockQueryResult);

      final result = await datasource.getHomeProfile();

      expect(result, isA<ProfileEntity>());
      expect(result.user.login, 'testuser');
      expect(result.user.name, 'Test User');
      expect(result.user.bio, 'Software Developer');
      expect(result.user.repositories.length, 2);
    });
  });
}
