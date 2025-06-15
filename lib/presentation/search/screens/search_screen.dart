import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        backgroundColor: colors.ffffffff,
        body: CustomScrollView(
          slivers: [
            // Search Screen AppBar Section
            searchScreenAppBarSection(colors, texts),
            SliverHeight(height: 15),
            // Search Screen TextField Section
            searchScreenTextFieldSection(colors, controller, texts),
            SliverHeight(height: 35),
            // Search History Recent Searches Title Section
            searchHistoryRecentSearchesTitleSection(texts, colors),
            SliverHeight(height: 15),
            // Search History Options Section
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 35.r),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    SearchHistoryCard(),
                    SearchHistoryCard(),
                    SearchHistoryCard(),
                  ],
                ),
              ),
            ),
            // Search History Search Results ListView.builder Section
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) => SearchResultProductsCard(),
            ),
            SliverHeight(height: 25),
          ],
        ),
      ),
    );
  }

  SliverPadding searchHistoryRecentSearchesTitleSection(
      ConstTexts texts, ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 35.r),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              texts.recentSearches,
              style: AppTextStyles.lato.semiBold(
                color: colors.ff221fif,
                fontSize: 19.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding searchScreenTextFieldSection(
      ConstColors colors, TextEditingController controller, ConstTexts texts) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: colors.ff221fif,
                width: 1.3.r,
              ),
            ),
          ),
          child: TextField(
            cursorColor: colors.ff221fif,
            controller: controller,
            style: AppTextStyles.lato.regular(
              color: colors.ff221fif,
              fontSize: 17.sp,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 7.r),
              hint: Text(
                texts.search,
                style: AppTextStyles.lato.regular(
                  color: colors.ffababab,
                  fontSize: 17.sp,
                ),
              ),
              suffixIcon: Icon(
                Icons.search,
                size: 24.r,
                color: colors.ff221fif,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar searchScreenAppBarSection(ConstColors colors, ConstTexts texts) {
    return SliverAppBar(
      backgroundColor: colors.ffffffff,
      floating: true,
      pinned: true,
      centerTitle: true,
      title: Text(
        texts.search,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 25.sp,
        ),
      ),
    );
  }
}

class SearchResultProductsCard extends StatelessWidget {
  const SearchResultProductsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        height: 107.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15.h),
        child: Row(
          spacing: 15.w,
          children: [
            // Search Card Image Part
            Container(
              height: 77.h,
              width: 77.w,
              decoration: BoxDecoration(
                color: colors.fff6f6f6,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                images.plant,
                height: 77.h,
                width: 77.w,
                fit: BoxFit.contain,
              ),
            ),
            // Search Card Texts Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "Panse  | Hybrid",
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 17.w,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "\$250",
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 17.w,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "156 items left",
                    style: AppTextStyles.lato.regular(
                      color: colors.ff221fif,
                      fontSize: 15.w,
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
}

class SearchHistoryCard extends StatelessWidget {
  const SearchHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextButton(
        onPressed: () {
          log("Search History Option Clicked.");
        },
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          overlayColor: WidgetStatePropertyAll(colors.transparent),
        ),
        child: SizedBox(
          height: 37.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 11.w,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: colors.ffababab,
                    size: 24.r,
                  ),
                  Text(
                    "Spider Plant",
                    style: AppTextStyles.lato.medium(
                      color: colors.ff221fif,
                      fontSize: 17.sp,
                    ),
                  )
                ],
              ),
              Transform.translate(
                offset: Offset(9.w, 0),
                child: IconButton(
                  onPressed: () {
                    log("Close Button Clicked.");
                  },
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    // overlayColor: WidgetStatePropertyAll(colors.transparent),
                  ),
                  icon: Icon(
                    Icons.close_rounded,
                    color: colors.ffababab,
                    size: 24.r,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
