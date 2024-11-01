import 'package:app_challenge/core/inject/app_inject_config.dart';
import 'package:app_challenge/features/home/data/datasources/home_profile_remote_datasource.dart';
import 'package:app_challenge/features/home/data/repositories/home_profile_repository.dart';
import 'package:app_challenge/features/home/domain/usecases/get_home_profile_usecase.dart';
import 'package:app_challenge/features/home/presenter/controllers/home_cubit.dart';

class HomeInject extends AppInjectConfig {
  @override
  void cubits() {
    getIt.registerLazySingleton<HomeCubit>(() =>
        HomeCubit(graphQlService: getIt(), getHomeProfileUsecase: getIt()));
  }

  @override
  void datasources() {
    getIt.registerLazySingleton(
        () => HomeProfileRemoteDatasource(client: getIt()));
  }

  @override
  void repositories() {
    getIt.registerLazySingleton(
        () => HomeProfileRepository(homeProfileRemoteDatasource: getIt()));
  }

  @override
  void usecases() {
    getIt.registerLazySingleton(
        () => GetHomeProfileUsecase(homeRepository: getIt()));
  }
}
