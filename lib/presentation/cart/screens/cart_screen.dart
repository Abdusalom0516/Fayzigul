import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_width.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

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
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) => CartProductCard(),
            )
          ],
        ),
      ),
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

class CartProductCard extends HookWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isCheckBoxClicked = useState(false);
    final quantity = useState(1);
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        height: 107.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
        child: Row(
          spacing: 15.w,
          children: [
            // CheckBox Section
            Transform.scale(
              scale: 1.15.r,
              child: Checkbox.adaptive(
                activeColor: colors.ff221fif,
                overlayColor: WidgetStatePropertyAll(colors.transparent),
                side: BorderSide(color: colors.ff221fif, width: 1.1.r),
                value: isCheckBoxClicked.value,
                onChanged: (value) {
                  isCheckBoxClicked.value = !isCheckBoxClicked.value;
                },
              ),
            ),
            // Product Image Section
            Container(
              width: 77.w,
              height: 77.h,
              decoration: BoxDecoration(
                color: colors.fff6f6f6,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                images.plant,
                height: 77.h,
                width: 77.w,
                fit: BoxFit.contain,
              ),
            ),
            // Product Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "Spider Plant",
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 17.sp,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "\$250",
                        style: AppTextStyles.lato.medium(
                          color: colors.ff007537,
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
                              log("Cart Plus Button Clicked.");
                              quantity.value++;
                            },
                            child: Icon(
                              Icons.add_box_outlined,
                              size: 24.r,
                              color: colors.ff221fif,
                            ),
                          ),
                          SizedBox(
                            width: 35.w,
                            child: Text(
                              textAlign: TextAlign.center,
                              quantity.value.toString(),
                              style: AppTextStyles.lato.medium(
                                color: colors.ff221fif,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
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
                              size: 24.r,
                              color: colors.ff221fif,
                            ),
                          ),
                        ],
                      ),
                      // Remove Button Section
                      InkWell(
                        onTap: () {
                          log("Remove Button Clicked.");
                        },
                        overlayColor: WidgetStatePropertyAll(colors.fff6f6f6),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: colors.ff221fif, width: 1.2.r),
                            ),
                          ),
                          child: Text(
                            texts.remove,
                            style: AppTextStyles.lato.medium(
                              color: colors.ff221fif,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
