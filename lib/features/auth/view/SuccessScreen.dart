import 'package:e_commerce_app/core/constants/app_assets.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/constants/app_strings.dart';
import 'package:e_commerce_app/core/constants/app_text_styles.dart';
import 'package:e_commerce_app/routes/app_router.dart';
import 'package:e_commerce_app/shared/app_button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppAssets.successConfetti, fit: BoxFit.contain),

                    Image.asset(AppAssets.successCheck, height: 150),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Text(
                AppStrings.success,
                style: AppTextStyles.title.copyWith(fontSize: 30),
              ),

              const SizedBox(height: 10),

              Text(
                AppStrings.successSub,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              AppButton(
                text: AppStrings.continueBtn,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.login,
                    (route) => false,
                  );
                },
              ),      
                      const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
