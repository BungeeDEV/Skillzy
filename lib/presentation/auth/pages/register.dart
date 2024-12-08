import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillzy/core/configs/assets/app_images.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';
import 'package:skillzy/data/repository/user_repository.dart';
import 'package:skillzy/data/servics/auth/auth_service.dart';
import 'package:skillzy/main.dart';
import 'package:skillzy/presentation/auth/pages/login.dart';

import 'package:flutter/material.dart';
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

                _registerHeading(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'JohnyDoe',
                        prefixIcon: Icon(Icons.person, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
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
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Passwort',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
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
                  child: _isLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text('Register'),
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
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.asset(
            AppImages.mascot,
            width: 45,
            height: 45,
          ),
        ),
      ],
    );
  }

  Widget _registerHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Column(
        children: [
          Text(
            'Erstelle einen Account',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              fontFamily: 'Satoshi',
            ),
          ),
        ],
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
                    color: AppColors.primary,
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
          email: _emailController.text, password: _passwordController.text);

      if (mounted) {
        showSnackBar(
            context, 'Yessir.', 'Account erstellt', ContentType.success);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showSnackBar(
            context, 'Fehler', "Fehler: ${e.message}", ContentType.failure);
        setState(() {
          _isLoading = false;
        });
      }
    } on PostgrestException catch (e) {
      if (mounted) {
        showSnackBar(
            context, 'Fehler', "Fehler: ${e.message}", ContentType.failure);
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(
            context, 'Fehler', 'Fehler aufgetreten: $e', ContentType.failure);
        setState(() {
          _isLoading = false;
        });
      }
    } finally {
      await UserRepository().createUser(_usernameController.text, null, null);
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
