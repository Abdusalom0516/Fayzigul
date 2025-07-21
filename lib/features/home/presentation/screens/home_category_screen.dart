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
            sliverAppBarSection(colors),
            // Categotiy Buttons Section
            categoryTitle == texts.equipments
                ? SliverHeight(height: 17)
                : categoryButtonsSection(texts, currentCategoryIndex),
            // Products GridView.builder Section
            productsGridViewSection(
                categoryTitle, texts, currentCategoryIndex.value, context),
            SliverHeight(height: 35),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter categoryButtonsSection(
      ConstTexts texts, ValueNotifier<int> currentCategoryIndex) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 64.h,
        width: double.infinity,
        child: Row(
          spacing: 3.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryCard(
              title: texts.all,
              isChosen: currentCategoryIndex.value == 0,
              func: () {
                currentCategoryIndex.value = 0;
              },
            ),
            CategoryCard(
              title: texts.plants,
              isChosen: currentCategoryIndex.value == 1,
              func: () {
                currentCategoryIndex.value = 1;
              },
            ),
            CategoryCard(
              title: texts.indoor,
              isChosen: currentCategoryIndex.value == 2,
              func: () {
                currentCategoryIndex.value = 2;
              },
            ),
            CategoryCard(
              title: texts.outdoor,
              isChosen: currentCategoryIndex.value == 3,
              func: () {
                currentCategoryIndex.value = 3;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget productsGridViewSection(String categoryTitle, ConstTexts texts,
      int currentCategoryIndex, BuildContext context) {
    final listOfPlants = context.read<ProductsBloc>().state.productsList;

    final indoorProducts = [
      ...listOfPlants.where((element) => element.categories.contains("Indoor")),
    ];

    // final outdoorProducts = [
    //   ...listOfPlants
    //       .where((element) => element.categories.contains("Outdoor")),
    //   ...listOfEquipments
    //       .where((element) => element.categories.contains("Outdoor")),
    // ];

    if (currentCategoryIndex == 2) {
      return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        sliver: SliverGrid.builder(
          itemCount: indoorProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 155 / 197,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
          ),
          itemBuilder: (context, index) => EquipmentsCard(
            product: indoorProducts[index],
          ),
        ),
      );
    }

    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
      sliver: SliverGrid.builder(
        itemCount: listOfPlants.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 155 / 197,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemBuilder: (context, index) => EquipmentsCard(
          product: listOfPlants[index],
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
        categoryTitle,
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
