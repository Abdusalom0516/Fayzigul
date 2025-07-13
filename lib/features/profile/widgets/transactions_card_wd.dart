import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/widgets/custom_divider_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/core/utils/date_time_converter.dart';
import 'package:plant_store/features/cart/data/models/transactions_model.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({super.key, required this.transactionsModel});
  final TransactionsModel transactionsModel;

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
                    formatDate(date: transactionsModel.date),
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
                    child: Image.network(transactionsModel.mainImage,
                        fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 3.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "Order ${transactionsModel.status}",
                          style: AppTextStyles.lato
                              .medium(color: colors.ff007537, fontSize: 17.sp),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          transactionsModel.products.first.product.name,
                          style: AppTextStyles.lato
                              .medium(color: colors.ff221fif, fontSize: 17.sp),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "${transactionsModel.products.length} ${texts.items}",
                          style: AppTextStyles.lato
                              .regular(color: colors.ff221fif, fontSize: 15.sp),
                        ),
                      ],
                    ),
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
