import 'package:equatable/equatable.dart';

import 'category_entity.dart';

class SponsorshipEntity extends Equatable {
  const SponsorshipEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.organization,
    required this.image,
    required this.monthlyAmount,
    required this.category,
    required this.categoryLabel,
    required this.isSponsored,
  });

  final String id;
  final String title;
  final String description;
  final String organization;
  final String image;
  final int monthlyAmount;
  final CategoryType category;
  final String categoryLabel;
  final bool isSponsored;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        organization,
        image,
        monthlyAmount,
        category,
        categoryLabel,
        isSponsored
      ];
}
