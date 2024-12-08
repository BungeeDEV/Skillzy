import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillzy/core/configs/assets/app_images.dart';

import '../../../data/servics/auth/auth_gate.dart';

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
    await Future.delayed(Duration.zero);
    Get.offAll(() => const AuthGate());
  }
}
