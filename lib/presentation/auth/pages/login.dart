import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';

import '../../../core/configs/assets/app_images.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(AppImages.logo),
                  ),
                  Text(
                    'Willkommen zurück',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Melde dich an, um fortzufahren',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 25),

              /// Form
              Form(
                child: Column(
                  children: [
                    /// Email
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Email', prefixIcon: Icon(Iconsax.direct)),
                    ),
                    const SizedBox(height: 25),

                    /// Password
                    TextFormField(
                      obscureText: true,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Passwort',
                          prefixIcon: Icon(Iconsax.password_check),
                          suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              Row(
                children: [
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                          activeColor: AppColors.primary,
                          value: true,
                          onChanged: (value) {}
                      )
                  ),
                  const SizedBox(width: 25),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _loginWidget() {
    return const Text(
      'Willkommen zurück 👋🏼',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
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
            'Du bit noch nicht registriert?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {},
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

class _loginButton extends StatelessWidget {
  const _loginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () => (),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'Account erstellen',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _registerButton extends StatelessWidget {
  const _registerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () => (),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'Account erstellen',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
