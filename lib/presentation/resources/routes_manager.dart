import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/forget_password/forget_password_screen.dart';
import 'package:flutter_advanced_course/presentation/login/login_screen.dart';
import 'package:flutter_advanced_course/presentation/main/main_screen.dart';
import 'package:flutter_advanced_course/presentation/onboarding/onboarding_view.dart';
import 'package:flutter_advanced_course/presentation/register/register_screen.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String homeRoute = "/home";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgot-password";
  static const String mainRoute = "/main";
  static const String storeDetailRoute = "/store-detail";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.storeDetailRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
      builder: (_) => const Scaffold(
          body: Center(child: Text(StringsManager.noRouteFound))));
}
