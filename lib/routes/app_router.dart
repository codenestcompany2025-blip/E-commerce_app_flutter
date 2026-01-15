import 'package:ecommerce_app/features/auth/view/SuccessScreen.dart';
import 'package:ecommerce_app/features/auth/view/forgot_password_screen.dart';
import 'package:ecommerce_app/features/auth/view/login_screen.dart';
import 'package:ecommerce_app/features/auth/view/reset_password_screen.dart';
import 'package:ecommerce_app/features/auth/view/signup_screen.dart';
import 'package:ecommerce_app/features/auth/view/verify_account_screen.dart';
import 'package:ecommerce_app/features/onboarding/view/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../features/onboarding/view/onboarding_screen.dart';

class AppRouter {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgot-password';
  static const verify = '/verify';
  static const resetPassword = '/reset-password';
  static const successverify = '/success-verify';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case verify:
        return MaterialPageRoute(builder: (_) => const VerifyAccountScreen());

      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case successverify:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not Found..'))),
        );
    }
  }
}
