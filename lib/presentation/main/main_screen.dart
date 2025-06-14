import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/home/screens/home_screen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: 0);
    final selectedIndex = useState(0);
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        backgroundColor: colors.ffffffff,
        body: PageView(
          controller: pageController,
          children: [
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),
          ],
        ),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0, -15.h),
          child: SlidingClippedNavBar(
            backgroundColor: Colors.white,
            iconSize: 30.r,
            activeColor: colors.ff221fif,
            inactiveColor: colors.ff221fif,
            selectedIndex: selectedIndex.value,
            onButtonPressed: (index) {
              selectedIndex.value = index;
              pageController.animateToPage(selectedIndex.value,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            barItems: [
              BarItem(
                icon: Icons.home,
                title: 'Home',
              ),
              BarItem(
                icon: Icons.search_rounded,
                title: 'Search',
              ),
              BarItem(
                icon: Icons.home,
                title: 'Home',
              ),
              BarItem(
                icon: Icons.home,
                title: 'Home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
