import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/profile/widgets/profile_card_wd.dart';
import 'package:plant_store/presentation/profile/screens/faqs_screen.dart';
import 'package:plant_store/presentation/profile/screens/transactions_history_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // Sliver Appbar Section
            sliverAppBarSection(colors),
            // Profile Image, Name & Email Section
            profileImagenameAndEmailSection(colors),
            SliverHeight(height: 35),
            // Profile General Part Title Section
            profileTitleSection(colors, texts.general),
            SliverHeight(height: 5),
            // Profile General Part Cards Section
            ProfileCard(title: texts.editInfo, func: () {}),
            ProfileCard(title: texts.plantGuide, func: () {}),
            ProfileCard(
              title: texts.transHist,
              func: () {
                AppRouter.go(TransactionsHistoryScreen());
              },
            ),
            ProfileCard(
                title: texts.qa,
                func: () {
                  AppRouter.go(FaqsScreen());
                }),
            SliverHeight(height: 35),
            // Profile Security Part Title Section
            profileTitleSection(colors, texts.security),
            SliverHeight(height: 5),
            // Profile Security Part Cards Section
            ProfileCard(title: texts.term, func: () {}),
            ProfileCard(title: texts.secPol, func: () {}),
            ProfileCard(title: texts.logOut, func: () {
              
            }, isRed: true),
          ],
        ),
      ),
    );
  }

  SliverPadding profileTitleSection(ConstColors colors, String text) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 48.r),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(bottom: 3.7.r),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: colors.ff7F7F7F,
                width: 1.3.r,
              ),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.lato.medium(
              color: colors.ff7F7F7F,
              fontSize: 19.sp,
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter profileImagenameAndEmailSection(ConstColors colors) {
    return SliverToBoxAdapter(
      child: Container(
        height: 72.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 45.r),
        child: Row(
          spacing: 26.r,
          children: [
            Container(
              width: 49.w,
              height: 49.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.ff007537,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "Abdusalom G'ayratov",
                    style: AppTextStyles.lato.medium(
                      color: colors.ff221fif,
                      fontSize: 18.5.sp,
                    ),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "abdusalom@gmail.com",
                    style: AppTextStyles.lato.medium(
                      color: colors.ff7F7F7F,
                      fontSize: 15.5.sp,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar sliverAppBarSection(ConstColors colors) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      backgroundColor: colors.ffffffff,
      title: Text(
        "Profile",
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
    );
  }
}
