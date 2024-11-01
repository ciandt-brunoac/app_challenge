import 'package:app_challenge/common/core/common_inject.dart';
import 'package:app_challenge/common/data/datasources/local_storage/local_storage_datasource.dart';
import 'package:app_challenge/common/data/repositories/local_storage_repository.dart';
import 'package:app_challenge/common/domain/usecases/get_local_storage_usecase.dart';
import 'package:app_challenge/common/domain/usecases/post_local_storage_usecase.dart';
import 'package:app_challenge/common/presenter/controllers/local_storage_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    getIt.reset();
    CommonInject().datasources();
    CommonInject().repositories();
    CommonInject().usecases();
    CommonInject().cubits();
  });

  group('Should inject all common dependencies', () {
    test('LocalStorageDatasource should be registered', () {
      expect(getIt.isRegistered<LocalStorageDatasource>(), true);
    });

    test('LocalStorageRepository should be registered', () {
      expect(getIt.isRegistered<LocalStorageRepository>(), true);
    });

    test('GetLocalStorageUsecase should be registered', () {
      expect(getIt.isRegistered<GetLocalStorageUsecase>(), true);
    });

    test('PostLocalStorageUseCase should be registered', () {
      expect(getIt.isRegistered<PostLocalStorageUseCase>(), true);
    });

    test('LocalStorageCubit should be registered', () {
      expect(getIt.isRegistered<LocalStorageCubit>(), true);
    });
  });
}
