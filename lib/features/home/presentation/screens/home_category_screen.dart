import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/home/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:plant_store/features/home/presentation/widgets/category_card_wd.dart';
import 'package:plant_store/features/home/presentation/widgets/equipments_card_wd.dart';

class HomeCategoryScreen extends HookWidget {
  const HomeCategoryScreen({super.key, required this.categoryTitle});
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final currentCategoryIndex = useState(0);

    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        backgroundColor: colors.ffffffff,
        body: CustomScrollView(
          slivers: [
            // Sliver App Bar Section
            sliverAppBarSection(texts: texts, colors: colors),
            // Categotiy Buttons Section
            categoryButtonsSection(texts, currentCategoryIndex),
            // Products GridView.builder Section
            productsGridViewSection(
                categoryTitle, texts, currentCategoryIndex.value, context),
            SliverHeight(height: 35),
          ],
        ),
      ),
    );
  }

  Widget categoryButtonsSection(
      ConstTexts texts, ValueNotifier<int> currentCategoryIndex) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 64.h,
          width: double.infinity,
          child: Row(
            spacing: 3.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryCard(
                title: texts.plants,
                isChosen: currentCategoryIndex.value == 0,
                func: () {
                  currentCategoryIndex.value = 0;
                },
              ),
              CategoryCard(
                title: texts.equipments,
                isChosen: currentCategoryIndex.value == 1,
                func: () {
                  currentCategoryIndex.value = 1;
                },
              ),
              CategoryCard(
                title: texts.careKit,
                isChosen: currentCategoryIndex.value == 2,
                func: () {
                  currentCategoryIndex.value = 2;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productsGridViewSection(String categoryTitle, ConstTexts texts,
      int currentCategoryIndex, BuildContext context) {
    final productsList = context.read<ProductsBloc>().state.productsList;

    final plantsList = [
      ...productsList.where((element) => element.categories.contains("Plants")),
    ];

    final equipmentsList = [
      ...productsList
          .where((element) => element.categories.contains("Equipments")),
    ];

    final careKitsList = [
      ...productsList.where((element) => element.categories.contains("kit")),
    ];

    if (currentCategoryIndex == 0) {
      return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        sliver: SliverGrid.builder(
          itemCount: plantsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 155 / 197,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
          ),
          itemBuilder: (context, index) => ProductsCard(
            product: plantsList[index],
          ),
        ),
      );
    }
    if (currentCategoryIndex == 1) {
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

    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverGrid.builder(
        itemCount: careKitsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 155 / 197,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemBuilder: (context, index) => ProductsCard(
          product: careKitsList[index],
        ),
      ),
    );
  }

  SliverAppBar sliverAppBarSection(
      {required ConstColors colors, required ConstTexts texts}) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      backgroundColor: colors.ffffffff,
      title: Text(
        texts.products,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          AppRouter.close();
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: colors.ff221fif,
          size: 21.r,
        ),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       AppRouter.open(MainScreen());
      //     },
      //     icon: Icon(
      //       Icons.shopping_cart_outlined,
      //       color: colors.ff221fif,
      //       size: 24.r,
      //     ),
      //   ),
      //   Width(width: 15)
      // ],
    );
  }
}
