import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_img_paths.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/home/widgets/circle_arrow_icon_button.dart';
import 'package:plant_store/presentation/home/widgets/prod_details_category_card.dart';
import 'package:plant_store/presentation/home/widgets/product_details_card.dart';

class ProductsDetailsScreen extends HookWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quantity = useState(0);
    final pageController = usePageController();
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        bottomNavigationBar: bottomNavigationSection(colors, texts, quantity),
        body: CustomScrollView(
          slivers: [
            appBarSection(colors, texts),
            // Product Images Section
            productImagesSection(colors, pageController, images),
            // Product Categories Section
            productCategoriesSection(),
            // Product Price Section
            productPriceSection(colors),
            SliverHeight(height: 15),
            // Product Details Title Section
            productTitleScreen(colors, texts.details),
            // Product Details Section
            productDetailsSection(colors, texts),
            SliverHeight(height: 25),
            // Product Description Title Section
            productTitleScreen(colors, texts.description),
            SliverHeight(height: 7),
            // Product Description Text Section
            productFullContentSection(colors, texts.lorem),
            SliverHeight(height: 25),
            // Product Description Title Section
            productTitleScreen(colors, texts.instruction),
            SliverHeight(height: 7),
            // Product Insrtuction Text Section
            productFullContentSection(colors, texts.lorem),
            SliverHeight(height: 25),
          ],
        ),
      ),
    );
  }

  SliverPadding productFullContentSection(ConstColors colors, String content) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.r),
      sliver: SliverToBoxAdapter(
        child: Text(
          content,
          style: AppTextStyles.lato.regular(
            color: colors.ff221fif,
            fontSize: 17.sp,
          ),
        ),
      ),
    );
  }

  SliverPadding productTitleScreen(ConstColors colors, String title) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.r),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 3.5.r),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: colors.ff221fif,
                width: 1.1.r,
              ),
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.lato.medium(
              color: colors.ff221fif,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter productDetailsSection(
      ConstColors colors, ConstTexts texts) {
    return SliverToBoxAdapter(
      child: Padding(
          padding:
              EdgeInsetsGeometry.symmetric(horizontal: 32.r, vertical: 15.r),
          child: Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                isValueGreen: true,
              ),
            ],
          )),
    );
  }

  Card bottomNavigationSection(
      ConstColors colors, ConstTexts texts, ValueNotifier<int> quantity) {
    return Card(
      elevation: 7.5.r,
      color: colors.ffffffff,
      child: Container(
        margin: EdgeInsets.only(bottom: 25.r),
        height: 167.h,
        width: double.infinity,
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.r, vertical: 15.r),
        child: Column(
          children: [
            // Cart Summary Section
            Column(
              spacing: 5.h,
              children: [
                // Number of Items Chosen and Subtotal Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        "${texts.youPicked} ${quantity.value} ${texts.items}",
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        texts.subtotal,
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                // Cart Quantity and Price Section
                Row(
                  spacing: 15.w,
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
                            color: colors.ffababab,
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
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        "\$99.9",
                        style: AppTextStyles.lato.bold(
                          color: colors.ff221fif,
                          fontSize: 24.w,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Height(height: 15),
            // Add to Cart Button Section
            addToCartButtonSection(colors, texts, quantity),
          ],
        ),
      ),
    );
  }

  Row addToCartButtonSection(
      ConstColors colors, ConstTexts texts, ValueNotifier<int> quantity) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  quantity.value <= 0 ? colors.ffababab : colors.ff007537),
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
        ),
      ],
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
                  for (int i = 0; i < 5; i++)
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
                  CircleArrowIconButton(
                    func: () {
                      pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    icon: Icons.arrow_back_ios_rounded,
                  ),
                  // Forward Icon Part
                  CircleArrowIconButton(
                    func: () {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    icon: Icons.arrow_forward_ios_rounded,
                  ),
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
      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.r),
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
      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.w, vertical: 21.h),
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
