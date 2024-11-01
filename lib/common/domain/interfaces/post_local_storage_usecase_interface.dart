import 'package:either_dart/either.dart';

abstract class PostLocalStorageUsecaseInterface {
  Future<Either<Exception, bool>> call(
      {required String key, required String value});
}
