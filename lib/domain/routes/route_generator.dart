import 'package:flutter/material.dart';
import 'package:pivo_test/presentation/screens/login_screen.dart';
import 'package:pivo_test/presentation/screens/signup_screen.dart';

class RouteGenerator {
  static const String login = "/";
  static const String signUp = "/signUp";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());


      
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
