import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'user_model.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.user,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      user: UserModel.fromJson(json['viewer']),
    );
  }
}
