import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_image.dart';
import '../../domain/entities/sponsorship_entity.dart';

class SponsorshipCard extends StatelessWidget {
  const SponsorshipCard({super.key, required this.sponsorship, this.onSponsor});

  static const double width = 200;
  static const double imageHeight = 236;

  final SponsorshipEntity sponsorship;
  final VoidCallback? onSponsor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16, offset: const Offset(0, 4)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardImage(sponsorship: sponsorship),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sponsorship.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    sponsorship.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.small,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.home_outlined, size: 14, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(sponsorship.organization, style: AppTextStyles.tiny),
                    ],
                  ),
                  const SizedBox(height: 6),
                  _PricePill(amount: sponsorship.monthlyAmount),
                  const Spacer(),
                  _SponsorButton(isSponsored: sponsorship.isSponsored, onPressed: onSponsor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({required this.sponsorship});

  final SponsorshipEntity sponsorship;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SponsorshipCard.imageHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppImage(sponsorship.image),
          if (sponsorship.isSponsored)
            const DecoratedBox(
              decoration: BoxDecoration(gradient: AppColors.sponsoredOverlay),
              child: Center(child: _SponsoredLabel()),
            )
          else
            PositionedDirectional(
              top: 10,
              start: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  sponsorship.categoryLabel,
                  style: AppTextStyles.small.copyWith(color: AppColors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SponsoredLabel extends StatelessWidget {
  const _SponsoredLabel();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.sponsored,
          style: AppTextStyles.title.copyWith(color: AppColors.white, fontSize: 22),
        ),
        const SizedBox(width: 6),
        const Icon(Icons.check_rounded, color: AppColors.white, size: 34),
      ],
    );
  }
}

class _PricePill extends StatelessWidget {
  const _PricePill({required this.amount});

  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.orphansBorder),
      ),
      child: Text(
        '$amount ${AppStrings.perMonth}',
        style: AppTextStyles.tiny.copyWith(color: AppColors.primaryDark, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _SponsorButton extends StatelessWidget {
  const _SponsorButton({required this.isSponsored, this.onPressed});

  final bool isSponsored;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: isSponsored ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.disabled,
          disabledForegroundColor: AppColors.disabledText,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          isSponsored ? AppStrings.sponsored : AppStrings.sponsorNow,
          style: AppTextStyles.small.copyWith(
            fontWeight: FontWeight.w700,
            color: isSponsored ? AppColors.disabledText : AppColors.white,
          ),
        ),
      ),
    );
  }
}
