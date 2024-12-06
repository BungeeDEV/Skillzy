import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';

class AuthService {
  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'Das angegebene Passwort ist zu schwach.';
      } else if (e.code == 'email-already-in-use') {
        message = 'Die E-Mail-Adresse wird bereits verwendet.';
      } else if (e.code == 'invalid-email') {
        message = 'Die E-Mail-Adresse ist ungültig.';
      } else {
        message = 'Ein Fehler ist aufgetreten. Bitte versuche es erneut.';
      }

      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: AppColors.lightGrey,
          textColor: Colors.black,
          fontSize: 14);
    }
  }
}
