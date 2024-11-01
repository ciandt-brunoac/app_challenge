import 'package:equatable/equatable.dart';

class RepositoryEntity extends Equatable {
  final String name;
  final String description;
  final String url;

  const RepositoryEntity({
    required this.name,
    required this.description,
    required this.url,
  });

  @override
  List<Object?> get props => [name, description, url];
}
