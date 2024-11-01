import 'package:app_challenge/features/home/data/models/repository_model.dart';
import 'package:app_challenge/features/home/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.login,
    required super.avatarUrl,
    required super.name,
    required super.bio,
    required super.repositories,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      avatarUrl: json['avatarUrl'],
      name: json['name'],
      bio: json['bio'],
      repositories: (json['repositories']['nodes'] as List)
          .map((repo) => RepositoryModel.fromJson(repo))
          .toList(),
    );
  }
}
