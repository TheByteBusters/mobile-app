import 'package:flutter/material.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/features/get_started/get_started_screen.dart';
import 'package:mobile_app/features/login/ui/login_screen.dart';
import 'package:mobile_app/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // arguments to passe to any screen
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.getStartedScreen:
        return MaterialPageRoute(
          builder: (_) => const GetStartedScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
