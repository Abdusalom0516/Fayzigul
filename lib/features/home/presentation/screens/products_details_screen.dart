import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_img_paths.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_text_button_wd.dart';
import 'package:plant_store/core/utils/app_network_image.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/core/utils/formatter.dart';
import 'package:plant_store/features/cart/presentation/blocs/cart/cart_bloc.dart';
import 'package:plant_store/features/cart/presentation/blocs/cart/cart_bloc_events.dart';
import 'package:plant_store/features/home/data/models/product_model.dart';
import 'package:plant_store/features/home/presentation/widgets/circle_arrow_icon_button_wd.dart';
import 'package:plant_store/features/home/presentation/widgets/prod_details_category_card_wd.dart';
import 'package:plant_store/features/home/presentation/widgets/product_details_card_wd.dart';

class ProductsDetailsScreen extends HookWidget {
  const ProductsDetailsScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final quantity = useState(0);
    final pageController = usePageController();
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        bottomNavigationBar: bottomNavigationSection(
            context: context,
            product: product,
            colors: colors,
            texts: texts,
            quantity: quantity),
        body: CustomScrollView(
          slivers: [
            appBarSection(colors, texts),
            // Product Images Section
            productImagesSection(product, colors, pageController, images),
            // Product Categories Section
            productCategoriesSection(product),
            // Product Price Section
            productPriceSection(product, colors),
            SliverHeight(height: 15),
            // Product Details Title Section
            productTitleSection(colors, texts.details),
            // Product Details Section
            productDetailsSection(colors, texts),
            SliverHeight(height: 25),
            // Product Description Title Section
            productTitleSection(colors, texts.description),
            SliverHeight(height: 7),
            // Product Description Text Section
            productFullContentSection(colors, product.description),
            SliverHeight(height: 25),
            // Product Description Title Section
            productTitleSection(colors, texts.instruction),
            SliverHeight(height: 7),
            // Product Insrtuction Text Section
            productFullContentSection(colors, product.instruction),
            SliverHeight(height: 25),
          ],
        ),
      ),
    );
  }

  SliverPadding productFullContentSection(ConstColors colors, String content) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
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

  SliverPadding productTitleSection(ConstColors colors, String title) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
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
              EdgeInsetsGeometry.symmetric(horizontal: 25.r, vertical: 15.r),
          child: Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailsCard(
                keyword: texts.mass,
                value: "${product.mass} ${product.massType}",
              ),
              ProductDetailsCard(
                keyword: texts.origin,
                value: product.origin,
              ),
              ProductDetailsCard(
                keyword: texts.status,
                value: "${product.quantity} ${texts.itemsLeft}",
                isValueGreen: true,
              ),
            ],
          )),
    );
  }

  Widget bottomNavigationSection({
    required ProductModel product,
    required ConstColors colors,
    required ConstTexts texts,
    required ValueNotifier<int> quantity,
    required BuildContext context,
  }) {
    return TextButton(
      style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        log("Add to Cart Button Clicked");
        context.read<CartBloc>().add(OnAddMultipleProductsToCart(
            product: product, quantity: quantity.value, context: context));
      },
      child: Card(
        elevation: 7.5.r,
        color: colors.ffffffff,
        child: Container(
          margin: EdgeInsets.only(bottom: 25.r),
          height: 167.h,
          width: double.infinity,
          padding:
              EdgeInsetsGeometry.symmetric(horizontal: 24.r, vertical: 15.r),
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
                              quantity.value--;
                              log("Cart Minus Button Clicked.");
                              if (quantity.value <= 0) {
                                context.read<CartBloc>().add(
                                    OnRemoveProductFromCart(
                                        product: product, context: context));
                                return;
                              }

                              context.read<CartBloc>().add(
                                  OnMinusProductFromCart(
                                      product: product,
                                      quantity: quantity.value,
                                      context: context));
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
                              if (quantity.value >= product.quantity) {
                                return;
                              }
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
                          "\$${formatNumber((product.price * quantity.value))}",
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
              CustomTextButton(
                buttonText: texts.addToCart,
                textColor: colors.ffffffff,
                backgroundColor:
                    quantity.value <= 0 ? colors.ffababab : colors.ff007537,
                func: () {
                  log("Add to Cart Button Clicked.");
                },
              )
            ],
          ),
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

  SliverToBoxAdapter productImagesSection(ProductModel product,
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
                  for (int i = 0; i < product.images.length; i++)
                    AppNetworkImage(
                      imageUrl: product.images[i],
                      height: 330.h,
                      width: 330.w,
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

  SliverPadding productPriceSection(ProductModel product, ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
      sliver: SliverToBoxAdapter(
        child: Text(
          "\$${formatNumber(product.price)}",
          style: AppTextStyles.lato.bold(
            color: colors.ff007537,
            fontSize: 24.w,
          ),
        ),
      ),
    );
  }

  SliverPadding productCategoriesSection(ProductModel product) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w, vertical: 21.h),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          spacing: 9.w,
          runSpacing: 9.w,
          children: [
            for (String category in product.categories)
              ProdDetCategoryCard(categoryTitle: category),
          ],
        ),
      ),
    );
  }
}
