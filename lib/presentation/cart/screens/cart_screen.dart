import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_width.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/cart/widgets/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
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

  SliverList cartProductSliverListBuilderSection() {
    return SliverList.builder(
      itemCount: 3,
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
