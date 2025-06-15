import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/cart/screens/cart_screen.dart';
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
              CartScreen(),
              SearchScreen(),
            ],
          ),
          bottomNavigationBar: Material(
            elevation: 8.r,
            child: BottomNavigationBar(
              iconSize: 29.r,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: selectedIndex.value,
              selectedItemColor: colors.ff221fif,
              unselectedItemColor: colors.ff221fif,
              backgroundColor: colors.ffffffff,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: AppTextStyles.lato.medium(
                color: colors.ff221fif,
                fontSize: 13.sp,
              ),
              onTap: (value) {
                selectedIndex.value = value;
                pageController.jumpToPage(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  activeIcon: Icon(
                    Icons.home_rounded,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search_rounded,
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 25.r,
                  ),
                  activeIcon: Icon(
                    Icons.shopping_cart_rounded,
                    size: 25.r,
                  ),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                  ),
                  activeIcon: Icon(
                    Icons.person_rounded,
                  ),
                  label: "Profile",
                )
              ],
            ),
          )),
    );
  }
}
