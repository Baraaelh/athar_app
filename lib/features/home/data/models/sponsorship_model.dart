import '../../domain/entities/category_entity.dart';
import '../../domain/entities/sponsorship_entity.dart';

class SponsorshipModel extends SponsorshipEntity {
  const SponsorshipModel({
    required super.id,
    required super.title,
    required super.description,
    required super.organization,
    required super.image,
    required super.monthlyAmount,
    required super.category,
    required super.categoryLabel,
    required super.isSponsored,
  });

  factory SponsorshipModel.fromJson(Map<String, dynamic> json) => SponsorshipModel(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        organization: json['organization'] as String,
        image: json['image'] as String,
        monthlyAmount: json['monthly_amount'] as int,
        category: CategoryType.values.byName(json['category'] as String),
        categoryLabel: json['category_label'] as String,
        isSponsored: json['is_sponsored'] as bool,
      );
}
