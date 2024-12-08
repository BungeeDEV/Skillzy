import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillzy/core/configs/assets/app_images.dart';
import 'package:skillzy/data/services/auth_service.dart';
import 'package:skillzy/presentation/auth/pages/login.dart';
import 'package:skillzy/presentation/welcome/pages/onboarding.dart';

import '../../home/pages/root.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }

  Future<void> redirect() async {
    AuthService().authStateChanges.listen((snapshot) {
      if (snapshot != null) {
        Get.to(() => const RootPage());
      } else {
        Get.to(() => const LoginPage());
      }
    });
  }
}
