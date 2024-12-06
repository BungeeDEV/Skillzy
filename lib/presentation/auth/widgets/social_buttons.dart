import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/theme/app_colors.dart';

class socialButtons extends StatelessWidget {
  const socialButtons({super.key, required this.assetName});

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      onPressed: () {
        // Implement social login logic
      },
      child: SvgPicture.asset(
        assetName,
        width: 24.0, // Normal size
        height: 24.0, // Normal size
        fit: BoxFit.contain,
      ),
    );
  }
}
