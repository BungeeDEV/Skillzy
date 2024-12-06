import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillzy/core/configs/assets/app_images.dart';
import 'package:skillzy/core/configs/assets/app_vectors.dart';
import 'package:skillzy/presentation/auth/pages/register.dart';
import 'package:skillzy/presentation/auth/widgets/login_divider.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../widgets/social_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _stayLoggedIn = false;

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
                  width: 80,
                  height: 80,
                  child: Image.asset(AppImages.logo),
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
                      decoration: InputDecoration(
                        hintText: 'john.doe@example.com',
                        prefixIcon:
                            Icon(Iconsax.direct_inbox5, color: AppColors.grey),
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
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '*************',
                        prefixIcon:
                            Icon(Iconsax.password_check, color: AppColors.grey),
                        suffixIcon: Icon(Iconsax.eye_slash, color: AppColors.grey),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.0),

                /// Login checkox
                Row(
                  children: [
                    Checkbox(
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
                  child: Text('Einloggen',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onPressed: () {
                    // Implement login logic
                  },
                ),
                SizedBox(height: 24.0),

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
      padding: const EdgeInsets.symmetric(vertical: 30),
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
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }

}