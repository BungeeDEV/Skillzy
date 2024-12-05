import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/configs/theme/app_colors.dart';

class onboardingDotsIndicator extends StatelessWidget {
  const onboardingDotsIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: kBottomNavigationBarHeight + 170,
        left: 0,
        right: 0,
        child: Center(
            child: SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                    dotColor: AppColors.grey,
                    activeDotColor: AppColors.primary,
                    dotHeight: 10,
                    dotWidth: 10),
                controller: PageController(), count: 3)));
  }
}
