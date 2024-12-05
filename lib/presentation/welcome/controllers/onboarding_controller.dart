import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillzy/presentation/auth/pages/register.dart';

class onboardingController extends GetxController {
  static onboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      // Todo: Change to login
      Get.to(() => const RegisterPage());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }

  void skipPage() {
    // Todo: Change to login
    Get.to(() => const RegisterPage());
  }
}
