import 'package:either_dart/either.dart';

abstract class LocalStorageRepositoryInterface {
  Future<Either<Exception, bool>> saveData({
    required String key,
    required String value,
  });
  Future<Either<Exception, String>> getData({
    required String key,
  });
}
