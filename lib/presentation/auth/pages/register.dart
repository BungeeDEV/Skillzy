import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillzy/core/configs/assets/app_images.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';
import 'package:skillzy/data/servics/auth/auth_service.dart';
import 'package:skillzy/presentation/auth/pages/login.dart';

import 'package:skillzy/presentation/auth/widgets/custom_input.dart';
import 'package:skillzy/presentation/auth/widgets/login_divider.dart';
import 'package:supabase/supabase.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/widgets/snackbar.dart';
import '../widgets/social_buttons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: _loginText(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 24.0),

                /// Heading
                _registerHeading(),
                SizedBox(height: 24.0),

                /// Username Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Benutzername',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    CustomAuthInput(
                        hintText: 'Benutzername',
                        icon: Iconsax.user,
                        color: AppColors.secondary,
                        focusColor: AppColors.secondary,
                        controller: _usernameController,
                        obscureText: false)
                  ],
                ),
                SizedBox(height: 16.0),

                /// Email Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    CustomAuthInput(
                        hintText: 'example@mail.com',
                        icon: Iconsax.direct_inbox5,
                        color: AppColors.secondary,
                        focusColor: AppColors.secondary,
                        controller: _emailController,
                        obscureText: false)
                  ],
                ),
                SizedBox(height: 16.0),

                /// Passwort Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Passwort',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    CustomAuthInput(
                        hintText: 'Passwort',
                        icon: Iconsax.password_check,
                        color: AppColors.secondary,
                        focusColor: AppColors.secondary,
                        controller: _passwordController,
                        obscureText: true)
                  ],
                ),
                SizedBox(height: 24.0),

                /// Terms of Service
                Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text('I agree to the Terms and Conditions'),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                /// Register Button
                ElevatedButton(
                  onPressed: (_isLoading || !_agreeToTerms) ? null : _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text('Registrieren'),
                  ),
                ),
                SizedBox(height: 20.0),

                /// Divider
                const loginDivider(),

                /// Social Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const socialButtons(assetName: AppVectors.googleLogo),
                    const socialButtons(assetName: AppVectors.appleLogo),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Get.to(() => const LoginPage());
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Image.asset(
            AppImages.mascot,
            width: 75,
            height: 75,
          ),
        ),
      ],
    );
  }

  Widget _registerHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  'Skillzy',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Satoshi',
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  'Herzlich Willkommen',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Satoshi',
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _loginText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hast du bereits einen Account?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Get.to(() => const LoginPage());
              },
              child: const Text(
                'Einloggen',
                style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await AuthService().signUpWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text);

      if (mounted) {
        showSnackBar(
            context, 'Yessir.', 'Account erstellt', ContentType.success);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showSnackBar(
            context, 'Fehler', "Fehler: ${e.message}", ContentType.failure);
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(
            context, 'Fehler', 'Fehler aufgetreten: $e', ContentType.failure);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
