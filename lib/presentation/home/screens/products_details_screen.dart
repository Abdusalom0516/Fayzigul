import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_img_paths.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/home/widgets/prod_details_category_card.dart';

class ProductsDetailsScreen extends HookWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quantity = useState(0);
    final pageController = usePageController();
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            appBarSection(colors, texts),
            // Product Images Section
            productImagesSection(colors, pageController, images),
            // Product Categories Section
            productCategoriesSection(),
            // Product Price Section
            productPriceSection(colors),
            // Product Details Section
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 48.r, vertical: 15.r),
                  child: Column(
                    spacing: 15.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 3.5.r),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: colors.ff221fif,
                              width: 1.2.r,
                            ),
                          ),
                        ),
                        child: Text(
                          texts.details,
                          style: AppTextStyles.lato.medium(
                            color: colors.ff221fif,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      ProductDetailsCard(
                        keyword: texts.mass,
                        value: "1 kg",
                      ),
                      ProductDetailsCard(
                        keyword: texts.origin,
                        value: "Afrika",
                      ),
                      ProductDetailsCard(
                        keyword: texts.status,
                        value: "156 ${texts.itemsLeft}",
                      ),
                    ],
                  )),
            ),
            SliverHeight(height: 45),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 24.r, vertical: 15.r),
              sliver: SliverToBoxAdapter(
                child: Column(
                  spacing: 5.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${texts.youPicked} 1 ${texts.items}",
                          style: AppTextStyles.lato.medium(
                            color: colors.ff221fif,
                            fontSize: 17.sp,
                          ),
                        ),
                        Text(
                          texts.subtotal,
                          style: AppTextStyles.lato.medium(
                            color: colors.ff221fif,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                log("Cart Minus Button Clicked.");
                                if (quantity.value <= 0) {
                                  return;
                                }
                                quantity.value--;
                              },
                              child: Icon(
                                Icons.indeterminate_check_box_outlined,
                                size: 35.r,
                                color: colors.ff221fif,
                              ),
                            ),
                            SizedBox(
                              width: 75.w,
                              child: Text(
                                textAlign: TextAlign.center,
                                quantity.value.toString(),
                                style: AppTextStyles.lato.medium(
                                  color: colors.ff221fif,
                                  fontSize: 17.5.sp,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                log("Cart Plus Button Clicked.");
                                quantity.value++;
                              },
                              child: Icon(
                                Icons.add_box_outlined,
                                size: 35.r,
                                color: colors.ff221fif,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$99.9",
                          style: AppTextStyles.lato.bold(
                            color: colors.ff221fif,
                            fontSize: 24.w,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              
            ),
            SliverHeight(height: 15),
            // Add to Cart Button Section
            SliverPadding(padding: EdgeInsetsGeometry.symmetric(horizontal: 24.r)
            , sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.ff007537),
                  padding: WidgetStatePropertyAll(
                      EdgeInsetsGeometry.symmetric(vertical: 15.r)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                onPressed: () {
                  log("Add to Cart Button Clicked.");
                },
                child: Text(
                  texts.addToCart,
                  style: AppTextStyles.lato.bold(
                    color: colors.ffffffff,
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ),),
            SliverHeight(height: 45),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBarSection(ConstColors colors, ConstTexts texts) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      backgroundColor: colors.ffffffff,
      title: Text(
        texts.details,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
    );
  }

  SliverToBoxAdapter productImagesSection(
      ConstColors colors, PageController pageController, ConstImgPaths images) {
    return SliverToBoxAdapter(
      child: Container(
        height: 259.h,
        width: double.infinity,
        decoration: BoxDecoration(color: colors.fff6f6f6),
        child: Stack(
          children: [
            // Product Images Part
            Align(
              alignment: Alignment.center,
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Image.asset(
                    images.plant,
                    height: 330.h,
                    width: 330.w,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    images.plant,
                    height: 330.h,
                    width: 330.w,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    images.plant,
                    height: 330.h,
                    width: 330.w,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            // Arrow Icons Part
            Container(
              alignment: Alignment.center,
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Backward Icon Part
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      log("Index: ${pageController.page}");
                      pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Card(
                      elevation: 3.5.r,
                      shape: CircleBorder(),
                      child: Container(
                        height: 45.w,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: colors.ffffffff,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: colors.ff221fif,
                          size: 24.r,
                        ),
                      ),
                    ),
                  ),
                  // Forward Icon Part
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      log("Index: ${pageController.page}");
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Card(
                      elevation: 3.5.r,
                      shape: CircleBorder(),
                      child: Container(
                        height: 45.w,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: colors.ffffffff,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: colors.ff221fif,
                          size: 24.r,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding productPriceSection(ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 48.r),
      sliver: SliverToBoxAdapter(
        child: Text(
          "\$99.9",
          style: AppTextStyles.lato.bold(
            color: colors.ff007537,
            fontSize: 24.w,
          ),
        ),
      ),
    );
  }

  SliverPadding productCategoriesSection() {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 48.w, vertical: 21.h),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          spacing: 9.w,
          runSpacing: 9.w,
          children: [
            ProdDetCategoryCard(categoryTitle: "Plants"),
            ProdDetCategoryCard(categoryTitle: "Outdoor"),
            ProdDetCategoryCard(categoryTitle: "Plants"),
            ProdDetCategoryCard(categoryTitle: "Outdoor")
          ],
        ),
      ),
    );
  }
}

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard(
      {super.key, required this.keyword, required this.value});
  final String keyword, value;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 3.5.r),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colors.ff221fif,
              width: 1.2.r,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              keyword,
              style: AppTextStyles.lato.regular(
                color: colors.ff3A3A3A,
                fontSize: 17.5.sp,
              ),
            ),
            Text(
              value,
              style: AppTextStyles.lato.regular(
                color: colors.ff3A3A3A,
                fontSize: 17.5.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
