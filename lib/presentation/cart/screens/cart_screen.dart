import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_width_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/cart/screens/checkout_screen.dart';
import 'package:plant_store/presentation/cart/widgets/cart_product_card_wd.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        // Bottom Navigation Section
        bottomNavigationBar: cartBottomNavigationSection(texts, colors),
        body: CustomScrollView(
          slivers: [
            // Sliver App Bar Section
            sliverAppBarSection(colors, texts),
            // Cart Products SliverList.builder Section
            cartProductSliverListBuilderSection(),
          ],
        ),
      ),
    );
  }

  Container cartBottomNavigationSection(ConstTexts texts, ConstColors colors) {
    return Container(
      height: 93.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      margin: EdgeInsets.only(bottom: 25.r),
      child: Column(
        spacing: 15.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                texts.subtotal,
                style: AppTextStyles.lato.medium(
                  color: colors.ff221fif,
                  fontSize: 19.sp,
                ),
              ),
              Text(
                "\$999",
                style: AppTextStyles.lato.semiBold(
                  color: colors.ff007537,
                  fontSize: 19.sp,
                ),
              ),
            ],
          ),
          TextButton(
            style:
                ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
            onPressed: () {
              log("Checkout Button Clicked.");
              AppRouter.go(CheckoutScreen());
            },
            child: Container(
              width: double.infinity,
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 25.r),
              decoration: BoxDecoration(
                color: colors.ff007537,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    texts.proceedToCheckout,
                    style: AppTextStyles.lato.medium(
                      color: colors.ffffffff,
                      fontSize: 17.sp,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: colors.ffffffff,
                    size: 17.r,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SliverList cartProductSliverListBuilderSection() {
    return SliverList.builder(
      itemCount: 7,
      itemBuilder: (context, index) => CartProductCard(),
    );
  }

  SliverAppBar sliverAppBarSection(ConstColors colors, ConstTexts texts) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      backgroundColor: colors.ffffffff,
      title: Text(
        texts.cart,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            log("Delete Button Clicked.");
          },
          icon: Icon(
            Icons.delete_outline_rounded,
            color: colors.ff221fif,
            size: 24.r,
          ),
        ),
        Width(width: 15)
      ],
    );
  }
}
