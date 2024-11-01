import 'package:app_challenge/features/home/domain/entities/repository_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String login;
  final String avatarUrl;
  final String name;
  final String? bio;
  final List<RepositoryEntity> repositories;

  const UserEntity({
    required this.login,
    required this.avatarUrl,
    required this.name,
    required this.bio,
    required this.repositories,
  });

  @override
  List<Object?> get props => [login, avatarUrl, name, bio, repositories];
}
