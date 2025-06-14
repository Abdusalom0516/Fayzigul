import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/home/screens/home_screen.dart';
import 'package:plant_store/presentation/search/screens/search_screen.dart';

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
              SearchScreen(),
              HomeScreen(),
              SearchScreen(),
            ],
          ),
          bottomNavigationBar: Material(
            elevation: 8.r,
            child: BottomNavigationBar(
              iconSize: 29.r,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: selectedIndex.value,
              selectedItemColor: colors.ff221fif,
              unselectedItemColor: colors.ff221fif,
              backgroundColor: colors.ffffffff,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                selectedIndex.value = value;
                pageController.jumpToPage(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "",
                )
              ],
            ),
          )),
    );
  }
}
