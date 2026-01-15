import 'package:e_commerce_app/core/constants/app_assets.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthFloatingTemplate extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final List<Widget> children;

  const AuthFloatingTemplate({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    const double imageHeight = 150;

    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Image.asset(AppAssets.signupBg, fit: BoxFit.cover),
          ),

          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  title,
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),

                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: imageHeight / 2),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(
                          24,
                          (imageHeight / 2) + 20,
                          24,
                          24,
                        ),
                        child: Column(
                          children: [
                            Text(
                              subtitle,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.dark.withOpacity(0.7),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 30),

                            ...children,
                          ],
                        ),
                      ),

                      Positioned(
                        top: 0,
                        child: Container(
                          height: imageHeight,
                          width: imageHeight,
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(image),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
