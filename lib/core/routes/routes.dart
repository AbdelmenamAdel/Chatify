import 'package:chatify/features/auth/screens/login_screen.dart';
import 'package:chatify/features/auth/screens/signup_screen.dart';
import 'package:chatify/features/chat/chat_screen.dart';
import 'package:chatify/features/home/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/'; //! initialRoute
  static const String signUp = '/signUp';
  static const String chat = '/chat';
  static const String signIn = '/signIn';
}

class AppRoutes {
  static Route? generatedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
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
