import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/widgets/custom_divider_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({
    super.key,
  });

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
          log("Transaction History Item pressed");
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 15.r),
          child: Column(
            spacing: 11.h,
            children: [
              // Transactions History Date Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wednesday, April 1st",
                    style: AppTextStyles.lato.medium(
                      color: colors.ff221fif,
                      fontSize: 17.sp,
                    ),
                  ),
                  CustomDivider(),
                ],
              ),
              // Transactions History Item Info Section
              Row(
                spacing: 15.w,
                children: [
                  Container(
                    height: 104.h,
                    width: 107.w,
                    color: colors.fff6f6f6,
                    child: Image.asset(images.plant, fit: BoxFit.cover),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Successful",
                        style: AppTextStyles.lato
                            .medium(color: colors.ff007537, fontSize: 17.sp),
                      ),
                      Text(
                        "Spider Plant",
                        style: AppTextStyles.lato
                            .medium(color: colors.ff221fif, fontSize: 17.sp),
                      ),
                      Text(
                        "2 ${texts.items}",
                        style: AppTextStyles.lato
                            .regular(color: colors.ff221fif, fontSize: 15.sp),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
