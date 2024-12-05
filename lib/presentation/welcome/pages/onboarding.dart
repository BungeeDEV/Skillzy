import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillzy/core/configs/assets/app_images.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/onboarding_dots.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> textParts = [
      {'text': 'Mit ', 'color': Colors.black},
      {'text': 'Skillzy', 'color': AppColors.primary},
      {'text': ' schlauer\n', 'color': Colors.black},
      {'text': 'durch den Tag!', 'color': Colors.black},
    ];

    List<Map<String, dynamic>> textParts2 = [
      {'text': 'Lernen war noch nie so einfach ', 'color': Colors.black}
    ];

    List<Map<String, dynamic>> textParts3 = [
      {'text': 'Lerne mit ', 'color': Colors.black},
      {'text': 'Skillzy', 'color': AppColors.primary},
      {'text': ', nach \ndeinen Wünschen!', 'color': Colors.black},
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Page View
          PageView(
            children: [
              onboardingPage(
                image: AppImages.onboarding1,
                textParts: textParts,
                subtitle:
                    'Entdecke, wie einfach es ist, dein Wissen mit unserer App zu erweitern.',
              ),
              onboardingPage(
                image: AppImages.onboarding2,
                textParts: textParts2,
                subtitle:
                    'Beginne deine Reise zu neuem Wissen – Schritt für Schritt, in deinem Tempo.',
              ),
              onboardingPage(
                image: AppImages.onboarding3,
                textParts: textParts3,
                subtitle:
                    'Wähle deine Interessen, starte die erste Lektion und entdecke jeden Tag etwas Neues.',
              )
            ],
          ),

          // Skip Button
          const onboardingSkip(),

          //   Smooth Page Indicator
          const onboardingDotsIndicator(),

          //   Next Button
          Positioned(
            bottom: kBottomNavigationBarHeight + 50,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Weiter',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
