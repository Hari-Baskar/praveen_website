import 'package:flutter/material.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';
import 'package:praveen_website/core/styles/app_size.dart';
import 'package:praveen_website/widgets/common/app_logo.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onAppsPressed;
  final VoidCallback onFeaturesPressed;
  final VoidCallback onSupportPressed;

  const Navbar({
    super.key,
    required this.onAboutPressed,
    required this.onAppsPressed,
    required this.onFeaturesPressed,
    required this.onSupportPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: AppSize.iconExtraLarge,
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.w12,
        vertical: AppSpacing.h12,
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.w16),
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBackground : AppColors.white)
            .withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppSize.buttonRadius + 4),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onAboutPressed,
            child: Row(
              children: [
                Text(
                  'Praveen Apps',
                  style: AppTextStyles.heading(
                    context,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (MediaQuery.of(context).size.width > AppSize.tabletBreakpoint)
            Row(
              children: [
                _NavLink(context, 'About', onAboutPressed),
                _NavLink(context, 'Apps', onAppsPressed),
                _NavLink(context, 'Features', onFeaturesPressed),
                _NavLink(context, 'Support', onSupportPressed),
              ],
            )
          else
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _NavLink(BuildContext context, String title, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(foregroundColor: AppColors.darkSecondaryText),
      child: Text(
        title,
        style: AppTextStyles.body(context, fontWeight: FontWeight.w600),
      ),
    );
  }
}
