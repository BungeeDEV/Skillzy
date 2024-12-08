import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillzy/core/configs/assets/app_images.dart';
import 'package:skillzy/core/configs/assets/app_vectors.dart';
import 'package:skillzy/core/widgets/snackbar.dart';
import 'package:skillzy/presentation/auth/pages/register.dart';
import 'package:skillzy/presentation/auth/widgets/login_divider.dart';
import 'package:skillzy/presentation/home/pages/root.dart';
import 'package:supabase/supabase.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../main.dart';
import '../widgets/social_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  bool _redirecting = false;
  bool _stayLoggedIn = false;
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen(
      (data) {
        if (_redirecting) return;
        final session = data.session;
        if (session != null) {
          _redirecting = true;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RootPage()),
          );
        }
      },
      onError: (error) {
        if (error is AuthException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message), backgroundColor: Colors.red),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Unexpected error occurred'),
                backgroundColor: Colors.red),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _registerText(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 48.0),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(AppImages.mascot),
                ),

                /// Heading Text
                _loginHeading(),

                /// Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'john.doe@example.com',
                        prefixIcon:
                            Icon(Iconsax.direct_inbox5, color: AppColors.brown),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.0),

                /// Password
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Passwort',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '*************',
                        prefixIcon: Icon(Iconsax.password_check,
                            color: AppColors.brown),
                        suffixIcon:
                            Icon(Iconsax.eye_slash, color: AppColors.brown),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.0),

                /// Login checkox
                /// TODO Implement login logic
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.brown,
                      value: _stayLoggedIn,
                      onChanged: (value) {
                        setState(() {
                          _stayLoggedIn = value!;
                        });
                      },
                    ),
                    Text('Angemeldet bleiben'),
                  ],
                ),
                SizedBox(height: 24.0),

                ElevatedButton(
                  onPressed: _isLoading ? null : _signIn,
                  child: Text(_isLoading ? 'Einloggen...' : 'Let\'s Go',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 24.0),

                /// Divider
                const loginDivider(),

                // Social Icons
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

  Widget _loginHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Wilkommen zurück',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _registerText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Du hast noch keinen Account?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Get.to(() => const RegisterPage());
              },
              child: const Text(
                'Registrieren',
                style: TextStyle(
                    color: AppColors.brown,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });

      /// Login
      await supabase.auth.signInWithPassword(
          password: _passwordController.text, email: _emailController.text);

      if (mounted) {
        showSnackBar(
            context, 'Erfolg', 'Login war erfolgreich.', ContentType.success);
        _emailController.clear();
        _passwordController.clear();
      }
    } on AuthException catch (error) {
      if (mounted) {
        /// Show error message
        showSnackBar(context, 'Fehler', 'Fehler aufgetreten: ${error.message}',
            ContentType.failure);
      }
    } catch (error) {
      if (mounted) {
        /// Show error message
        showSnackBar(context, 'Fehler', 'Fehler aufgetreten: $error',
            ContentType.failure);
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
