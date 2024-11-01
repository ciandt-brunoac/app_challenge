import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';

abstract class HomeProfileRemoteDatasourceInterface {
  Future<ProfileEntity> getHomeProfile();
}
