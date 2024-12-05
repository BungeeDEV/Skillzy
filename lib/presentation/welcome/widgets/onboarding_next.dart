import 'package:flutter/material.dart';
import 'package:skillzy/presentation/welcome/controllers/onboarding_controller.dart';

import '../../../core/configs/theme/app_colors.dart';

class onboarding_next extends StatelessWidget {
  const onboarding_next({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: kBottomNavigationBarHeight + 50,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
            onPressed: () => onboardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Weiter',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
