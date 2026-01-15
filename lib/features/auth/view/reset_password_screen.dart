import 'package:e_commerce_app/core/constants/app_assets.dart';
import 'package:e_commerce_app/core/constants/app_strings.dart';
import 'package:e_commerce_app/routes/app_router.dart';
import 'package:e_commerce_app/shared/app_button.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_floating_template.dart';
import '../widgets/auth_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passController = TextEditingController();
    final TextEditingController confirmPassController = TextEditingController();

    return AuthFloatingTemplate(
      title: AppStrings.resetPassword,
      subtitle: AppStrings.resetPasswordSub,
      image: AppAssets.resetPassIcon,
      children: [
        AuthTextField(
          label: AppStrings.password,
          hint: AppStrings.password,
          prefixIcon: Icons.lock_outline,
          isObscure: true,
          controller: passController,
        ),
        const SizedBox(height: 20),
        AuthTextField(
          label: AppStrings.confirmPassword,
          hint: AppStrings.confirmPassword,
          prefixIcon: Icons.lock_outline,
          isObscure: true,
          controller: confirmPassController,
        ),
        const SizedBox(height: 40),
        AppButton(
          text: AppStrings.resetPassword,
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRouter.successverify);
          },
        ),
      ],
    );
  }
}
