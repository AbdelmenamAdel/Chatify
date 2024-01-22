import 'package:chatify/features/auth/firebase/firebase_auth_servies.dart';
import 'package:chatify/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatify/core/utils/strings.dart';
import 'package:chatify/core/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isPassword = true;
  IconData? secure = Icons.visibility_off;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  final TextEditingController emailController2 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  //! toggle password
  void togglePassword() {
    emit(IsPasswordLoadingState());
    isPassword = !isPassword;
    secure = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(IsPasswordSuccessState());
  }

  //! signup
  Future<void> signUp(
      BuildContext context, String email, String password) async {
    emit(SignUpLoadingState());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emailController.clear();
      passwordController.clear();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == AppStrings.weekPassword) {
        ShowSnackBarMassenger(context, AppStrings.week);
        emit(SignUpErrorState());
      } else if (e.code == AppStrings.alreadyExist) {
        ShowSnackBarMassenger(context, AppStrings.exist);
        emit(SignUpErrorState());
      }
    } catch (e) {
      print(e);
      emit(SignUpErrorState());
    }
  }

  //!sign in
  Future<void> signIn(
      BuildContext context, String email, String password) async {
    emit(SignInLoadingState());
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccessState(email));
      // emailController2.clear();
      passwordController2.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == AppStrings.userNF) {
        ShowSnackBarMassenger(context, AppStrings.userNFM);
        emit(SignInErrorState());
      } else if (e.code == AppStrings.wrongPassword) {
        ShowSnackBarMassenger(context, AppStrings.wrongPasswordM);
        emit(SignInErrorState());
      }
    } catch (e) {
      print(e);
      emit(SignInErrorState());
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoadingState());
    try {
      await FirebaseAuth.instance.signOut();
      emit(SignOutSuccessState());
    } catch (e) {
      print(e);
      emit(SignOutErrorState());
    }
  }
}
