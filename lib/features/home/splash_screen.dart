import 'package:chatify/core/utils/assets.dart';
import 'package:chatify/core/utils/colors.dart';
import 'package:chatify/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.primary,
            AppColors.white,
            AppColors.primary,
          ],
        ),
        childWidget: SizedBox(
          height: 200,
          child: Image.asset('assets/app_icon.jpg'),
        ),
        duration: const Duration(milliseconds: 3100),
        animationDuration: const Duration(milliseconds: 1500),
        onAnimationEnd: () => debugPrint("On Scale End"),
        nextScreen: LoginScreen());
  }
}
