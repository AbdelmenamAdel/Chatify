import 'package:chatify/core/routes/routes.dart';
import 'package:chatify/core/utils/assets.dart';
import 'package:chatify/core/utils/colors.dart';
import 'package:chatify/core/utils/strings.dart';
import 'package:chatify/core/widgets/indecator.dart';
import 'package:chatify/core/widgets/navigate.dart';
import 'package:chatify/features/auth/screens/cubit/auth_state.dart';
import 'package:chatify/features/auth/screens/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
                return Form(
                  key: cubit.loginformkey,
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
                        child: Text(AppStrings.signUp,
                            style: TextStyle(
                                fontSize: 45, color: AppColors.primary)),
                      ),
                      //username
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: cubit.usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.empty;
                          }
                          return null;
                        },
                        onSaved: (value) => cubit.usernameController,
                        decoration: const InputDecoration(
                          labelText: AppStrings.username,
                          hintText: AppStrings.enterUsername,

                          // Change the color of the outline border
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      //email
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: cubit.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.empty;
                          } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value) ||
                              !value.contains('@gmail.com')) {
                            return AppStrings.mustContainGmail;
                          }
                          return null;
                        },
                        onSaved: (value) => cubit.emailController,
                        decoration: const InputDecoration(
                          labelText: AppStrings.email,
                          hintText: AppStrings.enterEmail,
                          // Change the color of the outline border
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // Password TextField
                      TextFormField(
                        controller: cubit.passwordController,
                        obscureText: cubit.isPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.empty;
                          } else if (value.length < 6) {
                            return AppStrings.week;
                          }
                          return null;
                        },
                        onSaved: (value) => cubit.emailController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.togglePassword();
                            },
                            color: AppColors.primary,
                            icon: Icon(
                              cubit.secure,
                            ),
                          ),
                          labelText: AppStrings.password,
                          hintText: AppStrings.enterPassword,
                          // Change the color of the outline border
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      state is SignUpLoadingState
                          ? const CustomLoadingIndicator()
                          : MaterialButton(
                              onPressed: () async {
                                if (cubit.loginformkey.currentState!
                                    .validate()) {
                                  cubit.signUp(
                                    context,
                                    cubit.emailController.text,
                                    cubit.passwordController.text,
                                  );
                                } else {}
                              },
                              height: 50.h,
                              minWidth: double.infinity,
                              color: AppColors.primary,
                              child: const Text(
                                AppStrings.signUp,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppStrings.alrhaveAcc),
                          TextButton(
                            onPressed: () {
                              context.navigateTo(Routes.login);
                            },
                            child: const Text(
                              AppStrings.login,
                              style: TextStyle(color: AppColors.primary),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    ));
  }
}
