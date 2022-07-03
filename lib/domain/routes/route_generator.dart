import 'package:flutter/material.dart';
import 'package:pivo_test/presentation/screens/onboarding_screen.dart';
import 'package:pivo_test/presentation/screens/signup_screen.dart';

class RouteGenerator {
  // static const String login = "/";
  // static const String signUp = "/signUp";
  static const String onboarding = "/";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      // case signUp:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());
      // case onboarding:

      default:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    }
  }
}
