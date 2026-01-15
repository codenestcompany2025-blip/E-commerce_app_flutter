import 'package:e_commerce_app/core/constants/app_assets.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/constants/app_strings.dart';
import 'package:e_commerce_app/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/signup_cubit.dart';
import '../cubit/signup_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_auth_section.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_footer.dart';
import '../widgets/white_auth_container.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
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
              child: BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = context.read<SignupCubit>();
                  return Column(
                    children: [
                      const AuthHeader(
                        title: AppStrings.createAccount,
                        subtitle: AppStrings.joinUs,
                        height: 30,
                      ),
                      Expanded(
                        child: WhiteAuthContainer(
                          paddingTop: 20,
                          child: Form(
                            key: cubit.formKey,
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                AuthTextField(
                                  label: AppStrings.fullName,
                                  hint: "Full Name",
                                  prefixIcon: Icons.person_outline,
                                  controller: cubit.nameController,
                                  validator: (v) =>
                                      v!.isEmpty ? "Required" : null,
                                ),
                                const SizedBox(height: 16),
                                AuthTextField(
                                  label: AppStrings.email,
                                  hint: AppStrings.email,
                                  prefixIcon: Icons.email_outlined,
                                  controller: cubit.emailController,
                                  validator: (v) =>
                                      v!.isEmpty ? "Required" : null,
                                ),
                                const SizedBox(height: 16),
                                AuthTextField(
                                  label: AppStrings.password,
                                  hint: AppStrings.password,
                                  prefixIcon: Icons.lock_outline,
                                  isObscure: cubit.isObscure,
                                  controller: cubit.passwordController,
                                  validator: (v) =>
                                      v!.isEmpty ? "Required" : null,
                                ),
                                const SizedBox(height: 16),
                                AuthTextField(
                                  label: AppStrings.confirmPassword,
                                  hint: AppStrings.confirmPassword,
                                  prefixIcon: Icons.lock_outline,
                                  isObscure: cubit.isObscure,
                                  controller: cubit.confirmPasswordController,
                                  validator: (v) =>
                                      v!.isEmpty ? "Required" : null,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Checkbox(
                                        value: cubit.isTermsAccepted,
                                        activeColor: AppColors.primary,
                                        side: const BorderSide(
                                          color: AppColors.grey,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        onChanged: cubit.toggleTerms,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      AppStrings.agreeToTerms,
                                      style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                state is SignupLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : AppButton(
                                        text: AppStrings.createAccount,
                                        onPressed: cubit.signup,
                                      ),

                                const SizedBox(height: 20),

                                AuthFooter(
                                  text: AppStrings.alreadyHaveAccount,
                                  actionText: AppStrings.login,
                                  onTap: () => Navigator.pop(context),
                                ),

                                const SizedBox(height: 20),
                                const SocialAuthSection(
                                  text: AppStrings.orSignIn,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
