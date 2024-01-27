import 'package:chatify/core/routes/routes.dart';
import 'package:chatify/core/utils/assets.dart';
import 'package:chatify/core/utils/colors.dart';
import 'package:chatify/core/utils/strings.dart';
import 'package:chatify/core/widgets/custom_text_form_field.dart';
import 'package:chatify/core/widgets/indecator.dart';
import 'package:chatify/core/widgets/navigate.dart';
import 'package:chatify/features/auth/cubit/auth_cubit.dart';
import 'package:chatify/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height * .08;
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
            listener: (BuildContext context, AuthState state) {
              if (state is SignInSuccessState) {
                context.navigateTo(Routes.chat);
              }
            },
            builder: (context, state) {
              AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
              return Form(
                key: cubit.loginformkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: h),
                    Image.asset(
                      AppAssets.app_icon,
                      height: 140.h,
                      width: 140.h,
                    ),
                    SizedBox(height: 30.h),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(AppStrings.login,
                          style: TextStyle(
                              fontSize: 45, color: AppColors.primary)),
                    ),
                    CustomTextFormField(
                      controller: cubit.emailController2,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.empty;
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value) ||
                            !value.contains('@gmail.com')) {
                          return AppStrings.mustContainGmail;
                        }
                        return null;
                      },
                      onSaved: (value) => cubit.emailController2,
                      labelText: AppStrings.email,
                      hintText: AppStrings.enterEmail,
                    ),
                    SizedBox(height: 20.h),
                    // Password TextField
                    CustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.isPassword,
                      controller: cubit.passwordController2,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.empty;
                        } else if (value.length < 6) {
                          return AppStrings.week;
                        }
                        return null;
                      },
                      onSaved: (value) => cubit.passwordController2,
                      suffixOnPressed1: () {
                        cubit.togglePassword();
                      },
                      suffix1: cubit.secure,
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterPassword,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    state is SignInLoadingState
                        ? CustomLoadingIndicator()
                        : MaterialButton(
                            onPressed: () async {
                              if (cubit.loginformkey.currentState!.validate()) {
                                cubit.signIn(
                                  context,
                                  cubit.emailController2.text,
                                  cubit.passwordController2.text,
                                );
                              } else {}
                            },
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
              );
            },
          ),
        ),
      ),
    ));
  }
}
