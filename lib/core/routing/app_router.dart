import 'package:flutter/material.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/features/auth/ui/auth_screen/auth_screen.dart';
import 'package:mobile_app/features/auth/ui/get_started/get_started_screen.dart';
import 'package:mobile_app/features/onboarding/onboarding_screen.dart';
import 'package:mobile_app/features/home/ui/home_screen/home_screen.dart';
import 'package:mobile_app/features/search/ui/search_request_screen.dart';
import 'package:mobile_app/features/search/ui/search_screen/search_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // arguments to passe to any screen
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.authScreen:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );
      case Routes.getStartedScreen:
        return MaterialPageRoute(
          builder: (_) => const GetStartedScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.searchRequestScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchRequestScreen(),
        );
      case Routes.searchingScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
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
