import 'package:chatify/features/auth/screens/login_screen.dart';
import 'package:chatify/features/auth/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/';
  static const String signUp = '/signUp';
  static const String login = '/login';
}

class AppRoutes {
  static Route? generatedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Found Route'),
            ),
          ),
        );
    }
  }
}
