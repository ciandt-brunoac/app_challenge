import 'package:app_challenge/common/data/repositories/local_storage_repository.dart';
import 'package:app_challenge/common/domain/interfaces/get_local_storage_usecase_interface.dart';
import 'package:either_dart/either.dart';

class GetLocalStorageUsecase implements GetLocalStorageUsecaseInterface {
  final LocalStorageRepository _localStorageRepository;

  GetLocalStorageUsecase(
      {required LocalStorageRepository localStorageRepository})
      : _localStorageRepository = localStorageRepository;

  @override
  Future<Either<Exception, String>> call({required String key}) async {
    return _localStorageRepository.getData(key: key);
  }
}
