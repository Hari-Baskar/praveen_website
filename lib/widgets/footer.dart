import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/utils/link_helper.dart';

class Footer extends StatelessWidget {
  final VoidCallback onPrivacyPressed;
  final VoidCallback onTermsPressed;
  final VoidCallback onSupportPressed;

  const Footer({
    super.key,
    required this.onPrivacyPressed,
    required this.onTermsPressed,
    required this.onSupportPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.h64, horizontal: AppSpacing.w24),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(LucideIcons.twitter, 'https://twitter.com/praveenapps'),
              SizedBox(width: AppSpacing.w16),
              _SocialIcon(LucideIcons.github, 'https://github.com/praveenapps'),
              SizedBox(width: AppSpacing.w16),
              _SocialIcon(LucideIcons.linkedin, 'https://linkedin.com/in/praveenapps'),
            ],
          ),
          SizedBox(height: AppSpacing.h32),
          Text(
            'Praveen Apps',
            style: AppTextStyles.heading(context, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: AppSpacing.h12),
          Text(
            'Building the future, one app at a time.',
            style: AppTextStyles.body(context, color: AppColors.darkSecondaryText),
          ),
          SizedBox(height: AppSpacing.h32),
          Wrap(
            spacing: 24,
            children: [
              _FooterLink(context, 'Privacy Policy', onPrivacyPressed),
              _FooterLink(context, 'Terms of Service', onTermsPressed),
              _FooterLink(context, 'Support', onSupportPressed),
            ],
          ),
          SizedBox(height: AppSpacing.h32),
          Text(
            '© 2024 Praveen Apps. All rights reserved.',
            style: AppTextStyles.small(context, color: AppColors.darkSecondaryText),
          ),
        ],
      ),
    );
  }

  Widget _SocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => LinkHelper.launchURL(url),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.darkBorder),
        ),
        child: Icon(icon, size: 20, color: AppColors.darkSecondaryText),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _FooterLink(BuildContext context, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: AppTextStyles.body(context, fontWeight: FontWeight.w600, color: AppColors.darkSecondaryText),
      ),
    );
  }
}
