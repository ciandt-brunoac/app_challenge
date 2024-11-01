import 'package:app_challenge/features/home/data/repositories/home_profile_repository.dart';
import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'package:either_dart/either.dart';

class GetHomeProfileUsecase {
  final HomeProfileRepository _homeRepository;

  GetHomeProfileUsecase({
    required HomeProfileRepository homeRepository,
  }) : _homeRepository = homeRepository;

  Future<Either<Exception, ProfileEntity>> call() async {
    return await _homeRepository.getProfile();
  }
}
