import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/styles/app_size.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onViewAppsPressed;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    required this.onViewAppsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSpacing.h64 * 1.5, horizontal: AppSpacing.w24),
      child: Column(
        children: [
          // Sparkles badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.w12, vertical: AppSpacing.h4),
            decoration: BoxDecoration(
              color: AppColors.buttonColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSize.badgeRadius),
              border: Border.all(color: AppColors.buttonColor.withOpacity(0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.sparkles, size: AppSize.iconSmall / 1.5, color: AppColors.buttonColor),
                SizedBox(width: AppSpacing.w8),
                Text(
                  'Building the future of mobile apps',
                  style: AppTextStyles.small(context, fontWeight: FontWeight.w600, color: AppColors.buttonColor),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2, end: 0),
          
          SizedBox(height: AppSpacing.h24),
          
          Text(
            'Building Useful Apps for\nEveryday Life',
            textAlign: TextAlign.center,
            style: AppTextStyles.splashHeading(
              context,
              fontSize: MediaQuery.of(context).size.width > 600 ? 72 : 40,
              color: isDark ? AppColors.white : AppColors.lightText,
            ),
          ).animate().fadeIn(delay: 100.ms, duration: 500.ms).slideY(begin: 0.2, end: 0),
          
          SizedBox(height: AppSpacing.h24),
          
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSize.maxAppCardWidth),
            child: Text(
              'Praveen Apps creates mobile experiences focused on productivity, social interaction, and practical tools that make your daily routine smoother and more connected.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body(
                context,
                color: isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText,
              ),
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 500.ms).slideY(begin: 0.2, end: 0),
          
          SizedBox(height: AppSpacing.h48),
          
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onViewAppsPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.w32, vertical: AppSpacing.h16 + 4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.buttonRadius)),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('View Apps', style: AppTextStyles.button(context)),
                    SizedBox(width: AppSpacing.w8),
                    Icon(LucideIcons.arrowRight, size: AppSize.iconSmall),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: onContactPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: isDark ? AppColors.white : AppColors.lightText,
                  side: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.w32, vertical: AppSpacing.h16 + 4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.buttonRadius)),
                ),
                child: Text('Contact', style: AppTextStyles.button(context, color: isDark ? Colors.white : AppColors.lightText)),
              ),
            ],
          ).animate().fadeIn(delay: 300.ms, duration: 500.ms).slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }
}
