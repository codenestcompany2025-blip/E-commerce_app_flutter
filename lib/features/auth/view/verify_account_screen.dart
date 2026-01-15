import 'package:e_commerce_app/core/constants/app_assets.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/constants/app_strings.dart';
import 'package:e_commerce_app/core/constants/app_text_styles.dart';
import 'package:e_commerce_app/features/auth/cubit/verify_state.dart';
import 'package:e_commerce_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/verify_cubit.dart';
import '../widgets/auth_floating_template.dart';
import '../widgets/otp_box.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyCubit(),
      child: BlocConsumer<VerifyCubit, VerifyState>(
        listener: (context, state) {
          if (state is VerifySuccess) {
            Navigator.pushNamed(context, AppRouter.resetPassword);
          }

          if (state is VerifyError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<VerifyCubit>();

          return AuthFloatingTemplate(
            title: AppStrings.verifyAccount,
            subtitle: "${AppStrings.verifyAccountSub}\n aboora@gmail.com",
            image: AppAssets.verifyIcon,
            children: [
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                  (index) => OtpBox(
                    autoFocus: index == 0,
                    onChanged: (value) {
                      cubit.onOtpChanged(index, value);

                      if (value.isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),

              const SizedBox(height: 40),

              if (state is VerifyLoading)
                const CircularProgressIndicator(color: AppColors.primary),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: AppColors.grey),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      AppStrings.resend,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              RichText(
                text: TextSpan(
                  text: AppStrings.codeExpires,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 12,
                    color: AppColors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: ' 2:00 ',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.error,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(text: AppStrings.seconds),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
