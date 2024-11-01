import 'package:app_challenge/features/home/domain/entities/repository_entity.dart';

class RepositoryModel extends RepositoryEntity {
  const RepositoryModel({
    required super.name,
    required super.description,
    required super.url,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'],
      description: json['description'] ?? '',
      url: json['url'],
    );
  }
}
