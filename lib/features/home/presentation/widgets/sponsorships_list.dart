import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/sponsorship_entity.dart';
import 'sponsorship_card.dart';

class SponsorshipsList extends StatelessWidget {
  const SponsorshipsList({super.key, required this.sponsorships, this.onSponsor});

  final List<SponsorshipEntity> sponsorships;
  final ValueChanged<SponsorshipEntity>? onSponsor;

  @override
  Widget build(BuildContext context) {
    if (sponsorships.isEmpty) {
      return SizedBox(
        height: 120,
        child: Center(child: Text(AppStrings.noResults, style: AppTextStyles.body)),
      );
    }
    return SizedBox(
      height: 450,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(28, 4, 28, 16),
        itemCount: sponsorships.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (_, i) => SponsorshipCard(
          sponsorship: sponsorships[i],
          onSponsor: onSponsor == null ? null : () => onSponsor!(sponsorships[i]),
        ),
      ),
    );
  }
}
