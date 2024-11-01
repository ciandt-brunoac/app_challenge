import 'package:app_challenge/common/data/repositories/local_storage_repository.dart';
import 'package:app_challenge/common/domain/interfaces/post_local_storage_usecase_interface.dart';
import 'package:either_dart/either.dart';

class PostLocalStorageUseCase implements PostLocalStorageUsecaseInterface {
  final LocalStorageRepository _localStorageRepository;

  PostLocalStorageUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  @override
  Future<Either<Exception, bool>> call(
      {required String key, required String value}) async {
    return await _localStorageRepository.saveData(key: key, value: value);
  }
}
