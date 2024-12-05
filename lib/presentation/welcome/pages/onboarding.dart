import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillzy/core/configs/assets/app_images.dart';
import 'package:skillzy/core/configs/theme/app_colors.dart';
import 'package:skillzy/presentation/welcome/controllers/onboarding_controller.dart';

import '../widgets/onboarding_dots.dart';
import '../widgets/onboarding_next.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(onboardingController());

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
            controller: controller.pageController,
            onPageChanged: (int index) {
              controller.updatePageIndicator(index);
            },
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
          const onboarding_next(),

        ],
      ),
    );
  }
}
