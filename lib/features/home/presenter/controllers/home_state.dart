import 'package:app_challenge/features/home/domain/entities/profile_entity.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final HomePageStatus status;
  final ProfileEntity? profile;

  const HomeState({
    required this.status,
    required this.profile,
  });

  HomeState copyWith({
    HomePageStatus? status,
    ProfileEntity? profile,
  }) {
    return HomeState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [status, profile];
}

enum HomePageStatus { initial, loading, success, failure }
