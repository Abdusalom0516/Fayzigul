import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class KitCard extends StatelessWidget {
  const KitCard({
    super.key,
  });

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
          // AppRouter.go(ProductsDetailsScreen());
        },
        child: Container(
          width: double.infinity,
          height: 134.h,
          margin: EdgeInsets.only(bottom: 15.r),
          decoration: BoxDecoration(
            color: colors.fff6f6f6,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(15.r),
                  child: Column(
                    spacing: 2.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        'Lemon Balm Grow Kit',
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 19.sp,
                        ),
                      ),
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'Include: Lemon Balm seeds, dung, Planta pot, marker...',
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif.withValues(alpha: 0.63),
                          fontSize: 15.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                child: Image.asset(
                  images.kit,
                  height: 134.h,
                  width: 108.w,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
