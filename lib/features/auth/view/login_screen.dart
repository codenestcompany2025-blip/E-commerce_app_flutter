import 'package:e_commerce_app/core/constants/app_assets.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/constants/app_strings.dart';
import 'package:e_commerce_app/routes/app_router.dart';
import 'package:e_commerce_app/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_auth_section.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_footer.dart';
import '../widgets/white_auth_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 400,
              child: Image.asset(AppAssets.loginBg, fit: BoxFit.cover),
            ),

            SafeArea(
              bottom: false,
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(AppStrings.loginSuccess),
                        backgroundColor: AppColors.success,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<LoginCubit>();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthHeader(
                        title: AppStrings.loginTitle,
                        subtitle: AppStrings.loginSubtitle,
                        height: 60,
                      ),
                      Expanded(
                        child: WhiteAuthContainer(
                          paddingTop: 40,
                          child: Form(
                            key: cubit.formKey,
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                AuthTextField(
                                  label: AppStrings.email,
                                  hint: AppStrings.email,
                                  prefixIcon: Icons.email_outlined,
                                  controller: cubit.emailController,
                                  validator: (v) => (v?.isEmpty ?? true)
                                      ? AppStrings.emailRequired
                                      : null,
                                ),
                                const SizedBox(height: 20),
                                AuthTextField(
                                  label: AppStrings.password,
                                  hint: AppStrings.password,
                                  prefixIcon: Icons.lock_outline,
                                  isObscure: cubit.isObscure,
                                  controller: cubit.passwordController,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      cubit.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: cubit.toggleVisibility,
                                  ),
                                  validator: (v) => (v?.length ?? 0) < 6
                                      ? AppStrings.passwordTooShort
                                      : null,
                                ),
                                const SizedBox(height: 10),

                                Row(
                                  children: [
                                    Checkbox(
                                      value: cubit.isRememberMe,
                                      onChanged: cubit.toggleRememberMe,
                                      activeColor: AppColors.primary,
                                    ),
                                    const Text(
                                      AppStrings.rememberMe,
                                      style: TextStyle(color: AppColors.grey),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRouter.forgotPassword,
                                        );
                                      },
                                      child: const Text(
                                        AppStrings.forgotPassword,
                                        style: TextStyle(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                state is LoginLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primary,
                                        ),
                                      )
                                    : AppButton(
                                        text: AppStrings.login,
                                        onPressed: cubit.login,
                                      ),

                                const SizedBox(height: 20),

                                AuthFooter(
                                  text: AppStrings.dontHaveAccount,
                                  actionText: AppStrings.createAccount,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    AppRouter.signup,
                                  ),
                                ),

                                const SizedBox(height: 30),
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
