import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_img_paths.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_loading_wd.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/home/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:plant_store/features/home/presentation/blocs/products_bloc/products_bloc_states.dart';
import 'package:plant_store/features/home/presentation/screens/home_category_screen.dart';
import 'package:plant_store/features/home/presentation/widgets/equipments_card_wd.dart';
import 'package:plant_store/features/home/presentation/widgets/kit_card_wd.dart';
import 'package:plant_store/features/home/presentation/widgets/plants_card_wd.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsBlocStates>(
      builder: (context, state) => AppStateWrapper(
        builder: (colors, texts, images) => Scaffold(
          backgroundColor: colors.ffffffff,
          body: CustomScrollView(
            slivers: [
              // Home Screen Top Image & Text Section
              homeScreenTopImageAndTextSection(colors, images, texts),
              SliverHeight(height: 25),
              // Home Screen Bottom Plants Title Section
              homeScreenBottomPlantsTitleSection(texts, colors, texts.plants),
              SliverHeight(height: 9),
              // Home Screen Bottom Plants GridView.builder Section
              homeScreenBottomPlantsGridViewSection(
                  colors: colors, texts: texts, state: state),
              SliverHeight(height: 9),
              // Home Screen Bottom See More Text Button Section
              homeScreenBottomPlantsSeeMoreTextButtonsSection(
                colors,
                texts,
                () {
                  log("See More Button of Plants Clicked.");
                  AppRouter.go(HomeCategoryScreen(categoryTitle: texts.plants));
                },
              ),
              SliverHeight(height: 25),
              // Home Screen Bottom Equipments Title Section
              homeScreenBottomPlantsTitleSection(
                  texts, colors, texts.equipments),
              SliverHeight(height: 9),
              // Home Screen Bottom Equipments GridView.builder Section
              homeScreenBottomEquipmentsGridViewSection(
                  state: state, colors: colors, texts: texts),
              SliverHeight(height: 9),
              // Home Screen Bottom See More Text Button Section
              homeScreenBottomPlantsSeeMoreTextButtonsSection(
                colors,
                texts,
                () {
                  log("See More Button Clicked.");
                  AppRouter.go(
                      HomeCategoryScreen(categoryTitle: texts.equipments));
                },
              ),
              SliverHeight(height: 25),
              // Home Screen Bottom Plant Care Title Section
              homeScreenBottomPlantsTitleSection(texts, colors, texts.careKit),
              SliverHeight(height: 9),
              // Home Screen Bottom Kits ListView.builder Section
              homeScreenBottomKitsListViewBuilderSection(
                  colors: colors, texts: texts, state: state),
              SliverHeight(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  SliverPadding homeScreenBottomKitsListViewBuilderSection(
      {required ConstColors colors,
      required ConstTexts texts,
      required ProductsBlocStates state}) {
    if (state.isLoading) {
      return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        sliver: SliverToBoxAdapter(
          child: CustomLoading(),
        ),
      );
    }
    if (state.errorMessage != null) {
      return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        sliver: SliverToBoxAdapter(
          child: Center(
            child: Text(
              state.errorMessage!,
              style: AppTextStyles.lato.medium(
                color: colors.ff221fif,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      );
    }

    final productsList = state.productsList;

    final careKitsList = [
      ...productsList.where((element) => element.categories.contains("kit")),
    ];

    if (careKitsList.isEmpty) {
      return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        sliver: SliverToBoxAdapter(
          child: Center(
            child: Text(
              texts.noProductsFound,
              style: AppTextStyles.lato.medium(
                color: colors.ff221fif,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.r),
      sliver: SliverList.builder(
        itemCount: 3,
        itemBuilder: (context, index) => KitCard(
          product: careKitsList[index],
        ),
      ),
    );
  }

  SliverToBoxAdapter homeScreenTopImageAndTextSection(
      ConstColors colors, ConstImgPaths images, ConstTexts texts) {
    return SliverToBoxAdapter(
      child: Container(
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
          // See New Arrivals Button
          TextButton(
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
              overlayColor: WidgetStatePropertyAll(colors.transparent),
            ),
            onPressed: () {
              // log("See New Arrivals Clicked");
              AppRouter.go(
                  HomeCategoryScreen(categoryTitle: texts.allProducts));
            },
            child: Row(
              spacing: 11.w,
              children: [
                Text(
                  texts.allProducts,
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

  SliverPadding homeScreenBottomPlantsGridViewSection(
      {required ConstColors colors,
      required ConstTexts texts,
      required ProductsBlocStates state}) {
    if (state.isLoading) {
      return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        sliver: SliverToBoxAdapter(
          child: CustomLoading(),
        ),
      );
    }
    if (state.errorMessage != null) {
      return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        sliver: SliverToBoxAdapter(
          child: Center(
            child: Text(
              state.errorMessage!,
              style: AppTextStyles.lato.medium(
                color: colors.ff221fif,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      );
    }

    final productsList = state.productsList;

    final plantsList = [
      ...productsList.where((element) => element.categories.contains("Plants")),
    ];

    if (plantsList.isEmpty) {
      return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        sliver: SliverToBoxAdapter(
          child: Center(
            child: Text(
              texts.noProductsFound,
              style: AppTextStyles.lato.medium(
                color: colors.ff221fif,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverGrid.builder(
        itemCount: plantsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 155 / 217,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemBuilder: (context, index) => PlantCard(
          product: plantsList[index],
        ),
      ),
    );
  }
}

SliverPadding homeScreenBottomEquipmentsGridViewSection(
    {required ProductsBlocStates state,
    required ConstColors colors,
    required ConstTexts texts}) {
  if (state.isLoading) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverToBoxAdapter(
        child: CustomLoading(),
      ),
    );
  }
  if (state.errorMessage != null) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: Text(
            state.errorMessage!,
            style: AppTextStyles.lato.medium(
              color: colors.ff221fif,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }

  final productsList = state.productsList;

  final equipmentsList = [
    ...productsList
        .where((element) => element.categories.contains("Equipments")),
  ];

  if (equipmentsList.isEmpty) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: Text(
            texts.noProductsFound,
            style: AppTextStyles.lato.medium(
              color: colors.ff221fif,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  } else {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverGrid.builder(
        itemCount: equipmentsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 155 / 197,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemBuilder: (context, index) => ProductsCard(
          product: equipmentsList[index],
        ),
      ),
    );
  }
}
