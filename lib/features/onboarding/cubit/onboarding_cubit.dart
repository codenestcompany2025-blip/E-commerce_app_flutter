import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import '../data/models/onboarding_model.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  int currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: AppStrings.welcomeTitle,
      subTitle: AppStrings.welcomeDesc,
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: AppStrings.addToCartTitle,
      subTitle: AppStrings.addToCartDesc,
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: AppStrings.securePaymentTitle,
      subTitle: AppStrings.securePaymentDesc,
    ),
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(OnboardingPageChanged(index));
  }

  void finishOnboarding() {
    emit(OnboardingFinished());
  }
}
