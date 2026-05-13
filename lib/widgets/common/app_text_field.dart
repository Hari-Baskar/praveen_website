import 'package:flutter/material.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/core/themes/app_text_styles.dart';
import 'package:praveen_website/core/styles/app_spacing.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.small(
            context,
            fontWeight: FontWeight.w600,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.lightSecondaryText,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: AppTextStyles.body(context),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.body(context, color: (isDark
                            ? AppColors.darkSecondaryText
                            : AppColors.lightSecondaryText)
                        .withOpacity(0.5)),
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.w16,
              vertical: maxLines > 1 ? AppSpacing.h16 : AppSpacing.h12,
            ),
          ),
        ),
      ],
    );
  }
}
