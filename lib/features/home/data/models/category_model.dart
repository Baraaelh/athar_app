import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.type, required super.title, required super.description});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        type: CategoryType.values.byName(json['type'] as String),
        title: json['title'] as String,
        description: json['description'] as String,
      );
}
