import 'package:e_commerce_app/core/constants/app_assets.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/constants/app_strings.dart';
import 'package:e_commerce_app/core/constants/app_text_styles.dart';
import 'package:e_commerce_app/routes/app_router.dart';
import 'package:e_commerce_app/shared/app_button.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_floating_template.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return AuthFloatingTemplate(
      title: AppStrings.forgottPassword,
      subtitle: AppStrings.forgotPasswordSub,
      image: AppAssets.forgotPassIcon,
      children: [
        AuthTextField(
          label: AppStrings.email,
          hint: AppStrings.email,
          prefixIcon: Icons.email_outlined,
          controller: emailController,
        ),
        const SizedBox(height: 30),

        AppButton(
          text: AppStrings.send,
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.verify);
          },
        ),

        const SizedBox(height: 15),

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Back To Login",
            style: AppTextStyles.body.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primary,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
