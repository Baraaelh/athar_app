import 'package:equatable/equatable.dart';

enum CategoryType { orphans, students, families, patients }

class CategoryEntity extends Equatable {
  const CategoryEntity({required this.type, required this.title, required this.description});

  final CategoryType type;
  final String title;
  final String description;

  @override
  List<Object?> get props => [type, title, description];
}
