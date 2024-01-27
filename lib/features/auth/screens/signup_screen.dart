import 'package:chatify/core/routes/routes.dart';
import 'package:chatify/core/utils/assets.dart';
import 'package:chatify/core/utils/colors.dart';
import 'package:chatify/core/utils/strings.dart';
import 'package:chatify/core/widgets/custom_text_form_field.dart';
import 'package:chatify/core/widgets/indecator.dart';
import 'package:chatify/core/widgets/navigate.dart';
import 'package:chatify/features/auth/cubit/auth_state.dart';
import 'package:chatify/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection(AppStrings.messages);

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
          child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
            if (state is SignUpSuccessState) {
              context.navigateTo(Routes.signIn);
            }
          }, builder: (context, state) {
            AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
            return Form(
              key: cubit.signupformkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 350.h),
                  Image.asset(
                    AppAssets.app_icon,
                    height: 140.h,
                    width: 140.h,
                  ),
                  SizedBox(height: 30.h),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppStrings.signUp,
                        style:
                            TextStyle(fontSize: 45, color: AppColors.primary)),
                  ),
                  //username
                  CustomTextFormField(
                    controller: cubit.usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.empty;
                      }
                      return null;
                    },
                    onSaved: (value) => cubit.usernameController,
                    labelText: AppStrings.username,
                    hintText: AppStrings.enterUsername,
                  ),

                  SizedBox(height: 20.h),
                  //email
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: cubit.emailController,
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
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterEmail,
                    onSaved: (value) => cubit.emailController,
                  ),

                  SizedBox(height: 20.h),
                  // Password TextField
                  CustomTextFormField(
                    controller: cubit.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: cubit.isPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.empty;
                      } else if (value.length < 6) {
                        return AppStrings.week;
                      }
                      return null;
                    },
                    suffix1: cubit.secure,
                    suffixOnPressed1: () {
                      cubit.togglePassword();
                    },
                    labelText: AppStrings.password,
                    hintText: AppStrings.enterPassword,
                    onSaved: (value) => cubit.passwordController,
                  ),

                  SizedBox(
                    height: 30.h,
                  ),
                  state is SignUpLoadingState
                      ? CustomLoadingIndicator()
                      : MaterialButton(
                          onPressed: () async {
                            if (cubit.signupformkey.currentState!.validate()) {
                              cubit.signUp(
                                context,
                                cubit.emailController.text,
                                cubit.passwordController.text,
                              );
                              user.add({
                                'Email': cubit.emailController.text,
                                'Password': cubit.passwordController.text,
                                'UserName': cubit.usernameController.text
                              });
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
                          context.navigateTo(Routes.signIn);
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
