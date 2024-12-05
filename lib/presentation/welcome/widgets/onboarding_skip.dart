import 'package:flutter/material.dart';
import 'package:skillzy/presentation/welcome/controllers/onboarding_controller.dart';

class onboardingSkip extends StatelessWidget {
  const onboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: kToolbarHeight,
        right: 20,
        child: TextButton(
          onPressed: () => onboardingController.instance.skipPage(),
          child: const Text(
            'Skip',
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}