import 'package:app_challenge/features/home/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final UserEntity user;

  const ProfileEntity({
    required this.user,
  });

  static const ProfileEntity empty = ProfileEntity(
    user: UserEntity(
      avatarUrl: '',
      login: '',
      name: '',
      bio: '',
      repositories: [],
    ),
  );

  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [user];
}
