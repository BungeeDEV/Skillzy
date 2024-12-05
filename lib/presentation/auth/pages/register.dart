import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';
import 'package:skillzy/presentation/auth/pages/login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: _loginText(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              _registerWidget(),
              const SizedBox(height: 15),

              /// Form
              Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: 'Vorname',
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                                labelText: 'Nachname',
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                      ],
                    ),

                    /// Spacer
                    const SizedBox(height: 25),

                    /// Username
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Benutername',
                          prefixIcon: Icon(Iconsax.user_edit)),
                    ),
                    const SizedBox(height: 25),

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
                    const SizedBox(height: 25),

                    /// Datenschutz etc
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
                        const Text('Ich bleibe angemeldet'),


                      ],
                    ),

                    const SizedBox(height: 50),

                    /// Button
                    SizedBox(
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
                    ),
                    const SizedBox(height: 25),

                    /// Divider
                    const Divider(
                      height: 50,
                      thickness: 1,
                    ),
                    const SizedBox(height: 25),

                    /// Social Media
                    // TODO: Create Social login buttons here
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerWidget() {
    return const Text(
      'Erstelle deinen Account',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
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
              )
          )
        ],
      ),
    );
  }
}
