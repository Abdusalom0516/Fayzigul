import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.backgroundColor,
    required this.func,
  });
  final String buttonText;
  final VoidCallback func;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextButton(
        onPressed: func,
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        child: Container(
          height: 50.h,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            buttonText,
            style: AppTextStyles.lato.regular(
              color: textColor,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
