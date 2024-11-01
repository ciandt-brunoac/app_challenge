import 'package:app_challenge/core/config/graphql_service.dart';
import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'package:app_challenge/features/home/domain/entities/repository_entity.dart';
import 'package:app_challenge/features/home/domain/entities/user_entity.dart';
import 'package:app_challenge/features/home/domain/usecases/get_home_profile_usecase.dart';
import 'package:app_challenge/features/home/presenter/controllers/home_cubit.dart';
import 'package:app_challenge/features/home/presenter/controllers/home_state.dart';
import 'package:app_challenge/features/home/presenter/pages/home_page.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([HomeCubit, GraphQlService, GetHomeProfileUsecase])
void main() {
  late HomeCubit homeCubit;
  late MockGraphQlService mockGraphQlService;
  late MockGetHomeProfileUsecase mockGetHomeProfileUsecase;
  final getIt = GetIt.instance;

  setUp(() {
    getIt.reset();
    mockGraphQlService = MockGraphQlService();
    mockGetHomeProfileUsecase = MockGetHomeProfileUsecase();
    homeCubit = HomeCubit(
      graphQlService: mockGraphQlService,
      getHomeProfileUsecase: mockGetHomeProfileUsecase,
    );

    getIt.registerSingleton<GraphQlService>(mockGraphQlService);
    getIt.registerSingleton<GetHomeProfileUsecase>(mockGetHomeProfileUsecase);
    getIt.registerSingleton<HomeCubit>(homeCubit);

    provideDummy<Either<Exception, ProfileEntity>>(
      const Right(ProfileEntity(
        user: UserEntity(
          login: '',
          avatarUrl: '',
          name: '',
          bio: '',
          repositories: [],
        ),
      )),
    );

    when(mockGetHomeProfileUsecase.call()).thenAnswer(
      (_) async => const Right(ProfileEntity(
        user: UserEntity(
          login: '',
          avatarUrl: '',
          name: '',
          bio: '',
          repositories: [],
        ),
      )),
    );
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<HomeCubit>(
        create: (_) => homeCubit,
        child: const HomePage(),
      ),
    );
  }

  tearDown(() {
    homeCubit.close();
  });

  group('HomePage Tests', () {
    testWidgets('displays CircularProgressIndicator when state is loading',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error message when state is failure',
        (WidgetTester tester) async {
      when(mockGetHomeProfileUsecase.call()).thenAnswer(
        (_) async => const Right(
          ProfileEntity(
            user: UserEntity(
              login: '',
              avatarUrl: '',
              name: '',
              bio: '',
              repositories: [],
            ),
          ),
        ),
      );

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('displays success widget when state is success',
        (WidgetTester tester) async {
      // Arrange
      const profile = ProfileEntity(
        user: UserEntity(
          avatarUrl: 'https://example.com/avatar.png',
          login: 'testuser',
          name: 'Test User',
          bio: 'This is a bio',
          repositories: [
            RepositoryEntity(
                name: 'Repo 1',
                description: 'Description 1',
                url: 'https://example.com/repo1'),
            RepositoryEntity(
                name: 'Repo 2',
                description: 'Description 2',
                url: 'https://example.com/repo2'),
          ],
        ),
      );

      when(homeCubit.state).thenReturn(
        const HomeState(
          status: HomePageStatus.success,
          profile: profile,
        ),
      );

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('@testuser'), findsOneWidget);
      expect(find.text('Test User'), findsOneWidget);
      expect(find.text('This is a bio'), findsOneWidget);
      expect(find.text('Repo 1'), findsOneWidget);
      expect(find.text('Repo 2'), findsOneWidget);
    });

    testWidgets('verifies that getHomeData method is called',
        (WidgetTester tester) async {
      // Arrange
      when(homeCubit.state).thenReturn(
        const HomeState(
          status: HomePageStatus.loading,
          profile: ProfileEntity(
            user: UserEntity(
              login: '',
              avatarUrl: '',
              name: '',
              bio: '',
              repositories: [],
            ),
          ),
        ),
      );

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      verify(homeCubit.getHomeData()).called(1);
    });
  });
}
