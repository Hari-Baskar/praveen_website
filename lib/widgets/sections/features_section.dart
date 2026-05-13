import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/styles/app_size.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final features = [
      {'name': 'Clean UI', 'desc': 'Intuitive and modern design focused on UX.', 'icon': LucideIcons.layout},
      {'name': 'Fast Performance', 'desc': 'Optimized code for smooth interactions.', 'icon': LucideIcons.zap},
      {'name': 'Secure Auth', 'desc': 'Protected with state-of-the-art security.', 'icon': LucideIcons.shield},
      {'name': 'Cloud Sync', 'desc': 'Access your data from any device.', 'icon': LucideIcons.cloud},
      {'name': 'Real-time', 'desc': 'Stay updated with live data.', 'icon': LucideIcons.refreshCw},
      {'name': 'Cross-platform', 'desc': 'Consistent experience across iOS/Android.', 'icon': LucideIcons.smartphone},
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.h64, horizontal: AppSpacing.w24),
      child: Column(
        children: [
          Text('Powerful Features', style: AppTextStyles.splashHeading(context, fontSize: 32)),
          SizedBox(height: AppSpacing.h64),
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: AppSize.featureCardWidth,
                  mainAxisExtent: AppSize.featureCardHeight,
                  crossAxisSpacing: AppSpacing.w24,
                  mainAxisSpacing: AppSpacing.h24,
                ),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final f = features[index];
                  return Container(
                    padding: EdgeInsets.all(AppSpacing.h24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(AppSize.cardRadius / 1.5),
                      border: Border.all(color: Theme.of(context).dividerColor),
                      boxShadow: isDark ? [] : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(f['icon'] as IconData, color: AppColors.buttonColor, size: AppSize.iconMedium),
                        SizedBox(height: AppSpacing.h16),
                        Text(
                          f['name'] as String, 
                          style: AppTextStyles.heading(context, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: AppSpacing.h8),
                        Expanded(
                          child: Text(
                            f['desc'] as String, 
                            style: AppTextStyles.body(context, color: isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: (index * 50).ms).scale(begin: const Offset(0.95, 0.95));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
