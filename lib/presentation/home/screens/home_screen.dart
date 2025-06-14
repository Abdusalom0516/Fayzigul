import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/home/widgets/equipments_card.dart';
import 'package:plant_store/presentation/home/widgets/plants_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        backgroundColor: colors.ffffffff,
        body: Column(
          children: [
            // Home Screen Top Section
            Container(
              height: 318.h,
              padding: EdgeInsets.only(top: 75.r),
              decoration: BoxDecoration(color: colors.fff6f6f6),
              child: Stack(
                children: [
                  // Home Screen Top Image Section
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      images.homeBg,
                      width: 375.w,
                      height: 205.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Home Screen Top Texts Section
                  homeScreenTopTextsSection(texts, colors),
                ],
              ),
            ),
            // Home Screen Bottom Section
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverHeight(height: 25),
                // Home Screen Bottom Plants Title Section
                homeScreenBottomPlantsTitleSection(texts, colors, texts.plants),
                SliverHeight(height: 9),
                // Home Screen Bottom Plants GridView.builder Section
                homeScreenBottomPlantsGridViewSection(),
                SliverHeight(height: 9),
                // Home Screen Bottom See More Text Button Section
                homeScreenBottomPlantsSeeMoreTextButtonsSection(
                  colors,
                  texts,
                  () {
                    log("See More Button Clicked.");
                  },
                ),
                SliverHeight(height: 25),
                // Home Screen Bottom Equipments Title Section
                homeScreenBottomPlantsTitleSection(texts, colors, texts.plants),
                SliverHeight(height: 9),
                // Home Screen Bottom Equipments GridView.builder Section
                homeScreenBottomEquipmentsGridViewSection(),
                SliverHeight(height: 9),
                // Home Screen Bottom See More Text Button Section
                homeScreenBottomPlantsSeeMoreTextButtonsSection(
                  colors,
                  texts,
                  () {
                    log("See More Button Clicked.");
                  },
                ),
                SliverHeight(height: 25),
                // Home Screen Bottom Plant Care Title Section
                homeScreenBottomPlantsTitleSection(
                    texts, colors, texts.plantCareKit),
                SliverHeight(height: 9),
                SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 24.r),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      height: 134.h,
                      decoration: BoxDecoration(
                        color: colors.fff6f6f6,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsetsGeometry.all(15.r),
                            child: Column(
                              spacing: 2.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  'Lemon Balm Grow Kit',
                                  style: AppTextStyles.lato.medium(
                                    color: colors.ff221fif,
                                    fontSize: 19.sp,
                                  ),
                                ),
                                Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  'Include: Lemon Balm seeds, dung, Planta pot, marker...',
                                  style: AppTextStyles.lato.medium(
                                    color:
                                        colors.ff221fif.withValues(alpha: 0.63),
                                    fontSize: 15.sp,
                                  ),
                                )
                              ],
                            ),
                          )),
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                            ),
                            child: Image.asset(
                              images.kit,
                              height: 134.h,
                              width: 108.w,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverHeight(height: 25),
              ],
            )),
          ],
        ),
      ),
    );
  }

  SliverPadding homeScreenBottomPlantsSeeMoreTextButtonsSection(
      ConstColors colors, ConstTexts texts, VoidCallback func) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.r),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                overlayColor: WidgetStatePropertyAll(colors.transparent),
              ),
              onPressed: func,
              child: Text(
                texts.seeMore,
                style: AppTextStyles.lato
                    .medium(
                      color: colors.ff221fif,
                      fontSize: 16.sp,
                    )
                    .copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: colors.ff221fif,
                      decorationThickness: 1.2.r,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverPadding homeScreenBottomPlantsTitleSection(
      ConstTexts texts, ConstColors colors, String text) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: AppTextStyles.lato.medium(
            color: colors.ff221fif,
            fontSize: 24.sp,
          ),
        ),
      ),
    );
  }

  Padding homeScreenTopTextsSection(ConstTexts texts, ConstColors colors) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      child: Column(
        spacing: 11.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text
              SizedBox(
                width: 223.w,
                child: Text(
                  texts.plantaShining,
                  style: AppTextStyles.lato.medium(
                    color: colors.ff221fif,
                    fontSize: 24.sp,
                  ),
                ),
              ),
              // Cart Button
              Transform.translate(
                offset: Offset(0, -15.h),
                child: Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: colors.ff221fif,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: colors.fff6f6f6,
                    size: 24.r,
                  ),
                ),
              )
            ],
          ),
          // See New Arrivals Button
          TextButton(
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
              overlayColor: WidgetStatePropertyAll(colors.transparent),
            ),
            onPressed: () {
              // log("See New Arrivals Clicked");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 11.w,
              children: [
                Text(
                  texts.seeNewArrivals,
                  style: AppTextStyles.lato.medium(
                    color: colors.ff007537,
                    fontSize: 17.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: colors.ff007537,
                  size: 24.w,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverPadding homeScreenBottomPlantsGridViewSection() {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverGrid.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 155 / 217,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemBuilder: (context, index) => PlantCard(),
      ),
    );
  }

  SliverPadding homeScreenBottomEquipmentsGridViewSection() {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverGrid.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 155 / 197,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemBuilder: (context, index) => EquipmentsCard(),
      ),
    );
  }
}
