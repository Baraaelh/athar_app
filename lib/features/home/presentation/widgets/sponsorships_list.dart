import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/sponsorship_entity.dart';
import 'sponsorship_card.dart';

/// Horizontal list whose height adapts to its tallest card, so it never
/// overflows regardless of screen size, font or text scale.
class SponsorshipsList extends StatelessWidget {
  const SponsorshipsList(
      {super.key, required this.sponsorships, this.onSponsor});

  final List<SponsorshipEntity> sponsorships;
  final ValueChanged<SponsorshipEntity>? onSponsor;

  @override
  Widget build(BuildContext context) {
    if (sponsorships.isEmpty) {
      return SizedBox(
        height: 120,
        child: Center(
            child: Text(AppStrings.noResults, style: AppTextStyles.body)),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(28, 4, 28, 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < sponsorships.length; i++) ...[
              if (i > 0) const SizedBox(width: 14),
              SponsorshipCard(
                sponsorship: sponsorships[i],
                onSponsor: onSponsor == null
                    ? null
                    : () => onSponsor!(sponsorships[i]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
