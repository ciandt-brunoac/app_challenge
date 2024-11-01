import 'package:either_dart/either.dart';

abstract class GetLocalStorageUsecaseInterface {
  Future<Either<Exception, String>> call({required String key});
}
