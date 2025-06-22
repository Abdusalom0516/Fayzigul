import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.payWithCash,
    required this.func,
    required this.methodTitle,
  });

  final ValueNotifier<bool> payWithCash;
  final Function(dynamic) func;
  final String methodTitle;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15.w,
            children: [
              Text(
                methodTitle,
                style: AppTextStyles.lato
                    .medium(color: colors.ff221fif, fontSize: 17.sp),
              ),
              Icon(
                methodTitle == texts.cash
                    ? Icons.attach_money_rounded
                    : Icons.credit_card_rounded,
                color: colors.ff007537,
                size: 25.r,
              )
            ],
          ),
          Radio.adaptive(
            value: methodTitle == texts.cash ? true : false,
            groupValue: payWithCash.value,
            onChanged: func,
            activeColor: colors.ff007537,
            overlayColor: WidgetStatePropertyAll(colors.ff221fif),
          )
        ],
      ),
    );
  }
}
