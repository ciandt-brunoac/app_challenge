import 'package:app_challenge/common/data/datasources/local_storage/local_storage_datasource.dart';
import 'package:app_challenge/common/data/repositories/local_storage_repository.dart';
import 'package:app_challenge/common/domain/usecases/get_local_storage_usecase.dart';
import 'package:app_challenge/common/domain/usecases/post_local_storage_usecase.dart';
import 'package:app_challenge/common/presenter/controllers/local_storage_cubit.dart';
import 'package:app_challenge/core/inject/app_inject_config.dart';

class CommonInject extends AppInjectConfig {
  @override
  void datasources() {
    getIt.registerFactory<LocalStorageDatasource>(() => LocalStorageDatasource(
          sharedPreferences: getIt(),
        ));
  }

  @override
  void repositories() {
    getIt.registerFactory<LocalStorageRepository>(() => LocalStorageRepository(
          localStorageDatasource: getIt(),
        ));
  }

  @override
  void usecases() {
    getIt.registerLazySingleton<GetLocalStorageUsecase>(
      () => GetLocalStorageUsecase(
        localStorageRepository: getIt(),
      ),
    );
    getIt.registerLazySingleton<PostLocalStorageUseCase>(
      () => PostLocalStorageUseCase(
        localStorageRepository: getIt(),
      ),
    );
  }

  @override
  void cubits() {
    getIt.registerLazySingleton<LocalStorageCubit>(
      () => LocalStorageCubit(
        getLocalStorageUsecase: getIt(),
        postLocalStorageUseCase: getIt(),
      ),
    );
  }
}
