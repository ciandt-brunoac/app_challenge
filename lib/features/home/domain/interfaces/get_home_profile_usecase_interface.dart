import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'package:either_dart/either.dart';

abstract class GetHomeProfileUsecaseInterface {
  Future<Either<Exception, ProfileEntity>> call();
}
