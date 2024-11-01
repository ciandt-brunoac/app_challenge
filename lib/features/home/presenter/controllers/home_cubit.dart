import 'package:app_challenge/core/config/graphql_service.dart';
import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'package:app_challenge/features/home/domain/entities/user_entity.dart';
import 'package:app_challenge/features/home/domain/usecases/get_home_profile_usecase.dart';
import 'package:app_challenge/features/home/presenter/controllers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GraphQlService _graphQlService;
  final GetHomeProfileUsecase _getHomeProfileUsecase;

  HomeCubit({
    required GraphQlService graphQlService,
    required GetHomeProfileUsecase getHomeProfileUsecase,
  })  : _graphQlService = graphQlService,
        _getHomeProfileUsecase = getHomeProfileUsecase,
        super(
          const HomeState(
            status: HomePageStatus.initial,
            profile: ProfileEntity(
              user: UserEntity(
                login: 'login',
                avatarUrl: 'avatarUrl',
                name: '',
                bio: '',
                repositories: [],
              ),
            ),
          ),
        );

  Future<void> getHomeData() async {
    emit(state.copyWith(status: HomePageStatus.loading));

    final result = await _getHomeProfileUsecase.call();

    result.either(
      (error) => emit(state.copyWith(status: HomePageStatus.failure)),
      (data) => emit(state.copyWith(
        status: HomePageStatus.success,
        profile: data,
      )),
    );
  }

  Future<void> initGraphqlService() async {
    await _graphQlService.init();
  }
}
