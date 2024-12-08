import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillzy/presentation/home/pages/home.dart';
import 'package:skillzy/presentation/home/pages/path.dart';
import 'package:skillzy/presentation/home/pages/profile.dart';
import 'package:skillzy/presentation/home/widgets/bottom_navigation_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int myIndex = 0;

  final List<Widget> navItems = [
    Icon(Icons.home, color: Colors.white, size: 24),
    Icon(Icons.account_tree, color: Colors.white, size: 24),
    Icon(Icons.list, color: Colors.white, size: 24),
    Icon(Icons.manage_accounts, color: Colors.white, size: 24),
  ];

  List<Widget> widgetList = [
    HomePage(),
    LearningPathPage(),
    Placeholder(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myIndex,
        children: widgetList,
      ),
      bottomNavigationBar: CustomBottomNavBar(
          items: navItems,
          myIndex: myIndex,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          }),
    );
  }
}
