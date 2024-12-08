import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final List<Widget> items;
  final ValueChanged<int> onTap;
  final int myIndex;
  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.myIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: widget.items,
      color: AppColors.brown,
      buttonBackgroundColor: AppColors.primary,
      backgroundColor: AppColors.darkBackground,
      height: 60,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Curves.linear,
      onTap: (index) {
        setState(() {
          widget.onTap(index);
        });
      },
    );
  }
}
