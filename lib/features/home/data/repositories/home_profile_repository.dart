import 'package:app_challenge/features/home/data/datasources/home_profile_remote_datasource.dart';
import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'package:app_challenge/features/home/domain/interfaces/home_profile_repository_interface.dart';
import 'package:either_dart/either.dart';

class HomeProfileRepository implements HomeProfileRepositoryInterface {
  final HomeProfileRemoteDatasource _homeProfileRemoteDatasource;

  HomeProfileRepository({
    required HomeProfileRemoteDatasource homeProfileRemoteDatasource,
  }) : _homeProfileRemoteDatasource = homeProfileRemoteDatasource;

  @override
  Future<Either<Exception, ProfileEntity>> getProfile() async {
    try {
      final result = await _homeProfileRemoteDatasource.getHomeProfile();

      // return Right(respose);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
