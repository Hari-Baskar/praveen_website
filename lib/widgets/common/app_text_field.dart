import 'package:flutter/material.dart';
import 'package:praveen_website/core/themes/app_colors.dart';
import 'package:praveen_website/theme/app_theme.dart';

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
          style: TextStyle(
            fontSize: 14,
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
          style: TextStyle(
            color: isDark ? AppColors.darkText : AppColors.lightText,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color:
                  (isDark
                          ? AppColors.darkSecondaryText
                          : AppColors.lightSecondaryText)
                      .withOpacity(0.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
