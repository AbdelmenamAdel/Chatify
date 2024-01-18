import 'package:chatify/core/routes/routes.dart';
import 'package:chatify/core/utils/assets.dart';
import 'package:chatify/core/utils/colors.dart';
import 'package:chatify/core/utils/strings.dart';
import 'package:chatify/core/widgets/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage(AppAssets.backgroundh), // Replace with your image path
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150.h),
                Image.asset(
                  AppAssets.app_icon,
                  height: 140.h,
                  width: 140.h,
                ),
                SizedBox(height: 30.h),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.login,
                      style: TextStyle(fontSize: 45, color: AppColors.primary)),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterEmail,
                    // Change the color of the outline border
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                SizedBox(height: 20.h),
                // Password TextField
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: AppStrings.password,
                    hintText: AppStrings.enterPassword,
                    // Change the color of the outline border
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                MaterialButton(
                  onPressed: () {},
                  height: 50.h,
                  minWidth: double.infinity,
                  color: AppColors.primary,
                  child: const Text(
                    AppStrings.login,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.dnthaveAcc),
                    TextButton(
                      onPressed: () {
                        context.navigateTo(Routes.signUp);
                      },
                      child: const Text(
                        AppStrings.signUp,
                        style: TextStyle(color: AppColors.primary),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
