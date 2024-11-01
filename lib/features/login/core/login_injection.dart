// import 'package:app_challenge/common/data/datasources/local_storage/local_storage_datasource.dart';
// import 'package:app_challenge/common/data/interfaces/local_storage_datasource_interface.dart';
// import 'package:app_challenge/common/data/repositories/local_storage_repository.dart';
// import 'package:app_challenge/common/domain/interfaces/local_storage_repository_interface.dart';
// import 'package:app_challenge/common/domain/usecases/get_local_storage_usecase.dart';
// import 'package:app_challenge/common/domain/usecases/post_local_storage_usecase.dart';
// import 'package:app_challenge/common/presenter/controllers/local_storage_cubit.dart';
// import 'package:app_challenge/core/inject/app_inject_config.dart';

// class LoginInject extends AppInjectConfig {
//   @override
//   void cubits() {
//     getIt.registerSingleton(() => LocalStorageCubit(
//           getLocalStorageUsecase: getIt(),
//           postLocalStorageUseCase: getIt(),
//         ));
//   }

//   @override
//   void datasources() {
//     getIt.registerSingleton(
//       () => LocalStorageDatasource(
//         sharedPreferences: getIt(),
//       ),
//     );
//   }

//   @override
//   void repositories() {
//     getIt.registerSingleton(() => LocalStorageRepository(
//           localStorageDatasource: getIt(),
//         ));
//   }

//   @override
//   void usecases() {
//     getIt.registerSingleton(
//       () => GetLocalStorageUsecase(
//         localStorageRepository: getIt(),
//       ),
//     );
//     getIt.registerSingleton(
//       () => PostLocalStorageUseCase(
//         localStorageRepository: getIt(),
//       ),
//     );
//   }
// }
