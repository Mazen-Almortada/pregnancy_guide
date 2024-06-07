import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/widgets/bnb.dart';
import 'package:pregnancy_guide/features/home/view/home_screen.dart';
import 'package:pregnancy_guide/features/home/view/tools_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white,
        body: PageView(
          reverse: true,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomeScreen(), ToolsScreen()],
        ),
        bottomNavigationBar: CustomBNB(
          currentIndex: _currentIndex,
          onIconTapped: onTabTapped,
          items: const [
            BNBItem(icon: Icons.pregnant_woman_rounded, content: "حملي"),
            BNBItem(icon: Icons.dashboard_sharp, content: "الأدوات"),
          ],
        ));
  }
}
