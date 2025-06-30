import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_width_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

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
            // productsGridViewSection(categoryTitle, texts),
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
              title: texts.newC,
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

  // SliverPadding productsGridViewSection(
  //     String categoryTitle, ConstTexts texts) {
  //   return categoryTitle == texts.equipments
  //       ? SliverPadding(
  //           padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
  //           sliver: SliverGrid.builder(
  //             itemCount: 10,
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               childAspectRatio: 155 / 197,
  //               crossAxisSpacing: 15.w,
  //               mainAxisSpacing: 15.h,
  //             ),
  //             itemBuilder: (context, index) => EquipmentsCard(),
  //           ),
  //         )
  //       : SliverPadding(
  //           padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
  //           sliver: SliverGrid.builder(
  //             itemCount: 10,
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               childAspectRatio: 155 / 217,
  //               crossAxisSpacing: 15.w,
  //               mainAxisSpacing: 15.h,
  //             ),
  //             itemBuilder: (context, index) => EquipmentsCard(),
  //           ),
  //         );
  // }

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
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: colors.ff221fif,
            size: 24.r,
          ),
        ),
        Width(width: 15)
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.func,
    required this.isChosen,
  });
  final String title;
  final VoidCallback func;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextButton(
        style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
        onPressed: func,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 5.r),
          decoration: BoxDecoration(
            color: isChosen ? colors.ff007537 : colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            title,
            style: AppTextStyles.lato.semiBold(
              color: !isChosen ? colors.ffababab : colors.ffffffff,
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    );
  }
}
