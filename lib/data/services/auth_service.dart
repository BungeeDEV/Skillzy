import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';
import 'package:skillzy/presentation/home/pages/root.dart';

import '../../presentation/home/pages/home.dart';

class AuthService {
  User? get currentUser => FirebaseAuth.instance.currentUser;

  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();

  Future<void> register({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.brown),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pop(context); // Close the loading dialog
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const RootPage()));

      // TODO: Create user in postgreSQL database here as well
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the loading dialog on error
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

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.brown),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const RootPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the loading dialog on error
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
        fontSize: 14,
      );
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => HomePage());
  }
}
