import 'package:app_challenge/common/data/datasources/local_storage/local_storage_datasource.dart';
import 'package:app_challenge/common/domain/interfaces/local_storage_repository_interface.dart';
import 'package:either_dart/either.dart';

class LocalStorageRepository implements LocalStorageRepositoryInterface {
  final LocalStorageDatasource _local;

  LocalStorageRepository({
    required LocalStorageDatasource localStorageDatasource,
  }) : _local = localStorageDatasource;

  @override
  Future<Either<Exception, String>> getData({required String key}) async {
    try {
      final result = _local.getData(key: key);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> saveData({
    required String key,
    required String value,
  }) async {
    try {
      await _local.setData(key: key, value: value);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
