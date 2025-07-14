import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_network_image.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';

class CheckoutItemsCard extends StatelessWidget {
  const CheckoutItemsCard({super.key, required this.cartProductModel});
  final CartProductModel cartProductModel;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          overlayColor: colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () {
          log("checkout Item pressed");
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 15.r),
          child: Row(
            spacing: 15.w,
            children: [
              Container(
                height: 104.h,
                width: 107.w,
                color: colors.fff6f6f6,
                child: AppNetworkImage(
                    imageUrl: cartProductModel.product.images.first),
              ),
              Expanded(
                child: Column(
                  spacing: 3.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      cartProductModel.product.name,
                      style: AppTextStyles.lato
                          .medium(color: colors.ff221fif, fontSize: 17.sp),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "\$${cartProductModel.product.price}",
                      style: AppTextStyles.lato
                          .medium(color: colors.ff221fif, fontSize: 17.sp),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "${cartProductModel.productQuantity} ${texts.items}",
                      style: AppTextStyles.lato
                          .regular(color: colors.ff221fif, fontSize: 15.sp),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
