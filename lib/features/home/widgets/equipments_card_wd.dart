import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_network_image.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/home/models/product_model.dart';
import 'package:plant_store/features/home/screens/products_details_screen.dart';

class EquipmentsCard extends StatelessWidget {
  const EquipmentsCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          overlayColor: WidgetStatePropertyAll(colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        onPressed: () {
          AppRouter.go(ProductsDetailsScreen(product: product));
        },
        child: SizedBox(
          child: Column(
            spacing: 2.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colors.fff6f6f6,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: AppNetworkImage(
                  imageUrl: product.images.first,
                  height: 134.h,
                  width: 155.w,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      product.name,
                      style: AppTextStyles.lato.medium(
                        color: colors.ff221fif,
                        fontSize: 19.sp,
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "\$${product.price}",
                      style: AppTextStyles.lato.medium(
                        color: colors.ff007537,
                        fontSize: 19.sp,
                      ),
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
