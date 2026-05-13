import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/utils/link_helper.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      {
        'name': 'Versus',
        'desc': 'Social voting and comparison app. Users upload opinions and participate in community battles.',
        'status': 'Available on Google Play',
        'color': AppColors.buttonColor,
        'url': 'https://play.google.com/store/apps/details?id=com.versus.app', // Example URL
      },
      {
        'name': 'Expense Tracker',
        'desc': 'Simple expense and spending management app. Track daily expenses and financial habits.',
        'status': 'Coming Soon',
        'color': AppColors.green,
        'url': '',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.h64, horizontal: AppSpacing.w24),
      color: Theme.of(context).brightness == Brightness.dark 
          ? AppColors.darkSecondaryBackgroundColor 
          : AppColors.lightSecondaryBackgroundColor,
      child: Column(
        children: [
          Text('Our Apps', style: AppTextStyles.splashHeading(context, fontSize: 32)),
          SizedBox(height: AppSpacing.h16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'Discover our range of applications designed to simplify your life and connect you with others.',
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle(context, color: AppColors.darkSecondaryText),
            ),
          ),
          SizedBox(height: AppSpacing.h64),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  children: apps.map((app) => Expanded(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.w12),
                    child: _AppCard(app: app),
                  ))).toList(),
                );
              }
              return Column(
                children: apps.map((app) => Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.h24),
                  child: _AppCard(app: app),
                )).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  final Map<String, dynamic> app;
  const _AppCard({required this.app});

  @override
  Widget build(BuildContext context) {
    final bool isComingSoon = app['status'] == 'Coming Soon';

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (app['color'] as Color).withOpacity(0.1),
            ),
            child: Icon(LucideIcons.appWindow, size: 40, color: app['color']),
          ),
          const SizedBox(height: 24),
          Text(app['name'], style: AppTextStyles.heading(context, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(app['desc'], style: AppTextStyles.body(context, color: AppColors.darkSecondaryText)),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(app['status'], style: AppTextStyles.small(context, fontWeight: FontWeight.w600, color: isComingSoon ? AppColors.darkSecondaryText : AppColors.green)),
              if (!isComingSoon)
                ElevatedButton.icon(
                  onPressed: () => LinkHelper.launchURL(app['url']),
                  icon: const Icon(LucideIcons.play, size: 16),
                  label: Text('Google Play', style: AppTextStyles.small(context, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                )
              else
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('We will notify you when this app is available!')),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).dividerColor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('Notify Me', style: AppTextStyles.small(context)),
                ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }
}
