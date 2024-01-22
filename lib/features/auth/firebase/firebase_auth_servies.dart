import 'package:chatify/core/utils/strings.dart';
import 'package:chatify/core/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthServices {
  Future<void> SignUp(
      BuildContext context, String email, String password) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ShowSnackBarMassenger(context, AppStrings.success);
    } on FirebaseAuthException catch (e) {
      if (e.code == AppStrings.weekPassword) {
        ShowSnackBarMassenger(context, AppStrings.week);
      } else if (e.code == AppStrings.alreadyExist) {
        ShowSnackBarMassenger(context, AppStrings.exist);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> SignIn(
      BuildContext context, String email, String password) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == AppStrings.userNF) {
        ShowSnackBarMassenger(context, AppStrings.userNFM);
      } else if (e.code == AppStrings.wrongPassword) {
        ShowSnackBarMassenger(context, AppStrings.wrongPasswordM);
      }
    } catch (e) {
      print(e);
    }
  }
}
