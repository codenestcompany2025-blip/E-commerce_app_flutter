import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialAuthSection extends StatelessWidget {
  final String text;

  const SocialAuthSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: AppColors.grey)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: AppTextStyles.body.copyWith(fontSize: 14),
              ),
            ),
            const Expanded(child: Divider(color: AppColors.grey)),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(Icons.facebook, AppColors.facebook),
            const SizedBox(width: 20),
            _buildSocialButton(FontAwesomeIcons.pinterest, AppColors.pinterest),
            const SizedBox(width: 20),
            _buildSocialButton(FontAwesomeIcons.linkedinIn, AppColors.linkedin),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(icon, color: AppColors.white, size: 24),
    );
  }
}
