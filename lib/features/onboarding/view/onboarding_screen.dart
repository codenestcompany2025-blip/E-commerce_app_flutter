import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/routes/app_router.dart';
import 'package:ecommerce_app/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_text_styles.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/dots_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            if (state is OnboardingFinished) {
              Navigator.pushReplacementNamed(context, AppRouter.login);
            }
          },
          builder: (context, state) {
            bool isLastPage = cubit.currentIndex == 2;

            return Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: !isLastPage,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: TextButton(
                      onPressed: cubit.finishOnboarding,
                      child: Text(
                        AppStrings.skip,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: cubit.changePage,
                    itemCount: cubit.pages.length,
                    itemBuilder: (context, index) {
                      return OnboardingPage(
                        title: cubit.pages[index].title,
                        description: cubit.pages[index].subTitle,
                        illustration: Image.asset(cubit.pages[index].image),
                      );
                    },
                  ),
                ),

                DotsIndicator(currentIndex: cubit.currentIndex, count: 3),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: AppButton(
                    text: isLastPage ? AppStrings.start : AppStrings.next,
                    onPressed: () {
                      if (isLastPage) {
                        cubit.finishOnboarding();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}
