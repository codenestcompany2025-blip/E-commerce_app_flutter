import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double height;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height),
          Text(
            title,
            style: AppTextStyles.title.copyWith(
              color: AppColors.white,
              fontSize: 24,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: AppTextStyles.body.copyWith(
              color: AppColors.white.withOpacity(0.9),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
