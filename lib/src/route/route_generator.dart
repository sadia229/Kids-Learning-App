import 'package:flutter/material.dart';
import 'package:kid_starter/src/features/home/components/story_details.dart';
import 'package:kid_starter/src/features/home/components/story_view.dart';
import 'package:kid_starter/src/features/home/view/home_screen.dart';
import 'package:kid_starter/src/features/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map? arguments = settings.arguments as Map?;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/storyView':
        return MaterialPageRoute(
          builder: (_) => const StoryViewScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
