import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        backgroundColor: colors.ffffffff,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 75.r,
              ),
              height: 318.h,
              decoration: BoxDecoration(
                color: colors.fff6f6f6,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      images.homeBg,
                      width: 375.w,
                      height: 205.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                    child: Column(
                      spacing: 11.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 223.w,
                              child: Text(
                                texts.plantaShining,
                                style: AppTextStyles.lato.medium(
                                  color: colors.ff221fif,
                                  fontSize: 24.sp,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, -15.h),
                              child: Container(
                                height: 48.h,
                                width: 48.w,
                                decoration: BoxDecoration(
                                  color: colors.ff221fif,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: colors.fff6f6f6,
                                  size: 24.r,
                                ),
                              ),
                            )
                          ],
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                            overlayColor:
                                WidgetStatePropertyAll(colors.transparent),
                          ),
                          onPressed: () {
                            // log("See New Arrivals Clicked");
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 11.w,
                            children: [
                              Text(
                                texts.seeNewArrivals,
                                style: AppTextStyles.lato.medium(
                                  color: colors.ff007537,
                                  fontSize: 17.sp,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: colors.ff007537,
                                size: 24.w,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverHeight(height: 25),
                SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      texts.plants,
                      style: AppTextStyles.lato.medium(
                        color: colors.ff221fif,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                ),
                SliverHeight(height: 9),
                SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 155 / 217,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.h,
                    ),
                    itemBuilder: (context, index) => SizedBox(
                      child: Column(
                        spacing: 2.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: colors.fff6f6f6,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Image.asset(
                              images.plant,
                              height: 134.h,
                              width: 155.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Spider Plant",
                                  style: AppTextStyles.lato.medium(
                                    color: colors.ff221fif,
                                    fontSize: 19.sp,
                                  ),
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Indoor",
                                  style: AppTextStyles.lato.medium(
                                    color: colors.ffababab,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "\$250",
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
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
