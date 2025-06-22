import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.func});

  final TextEditingController controller;
  final String hint;
  final Function(String) func;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextField(
        controller: controller,
        cursorColor: colors.ff221fif,
        onChanged: func,
        style: AppTextStyles.lato
            .regular(color: colors.ff221fif, fontSize: 17.r)
            .copyWith(
              decoration: TextDecoration.none,
              decorationColor: colors.transparent,
              decorationThickness: 0,
            ),
        decoration: InputDecoration(
          label: Text(hint),
          labelStyle: AppTextStyles.lato
              .regular(color: colors.ff7D7B7B, fontSize: 17.r),
          contentPadding: EdgeInsets.zero,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colors.ff7D7B7B,
              width: 1.r,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colors.ff7D7B7B,
              width: 1.r,
            ),
          ),
        ),
      ),
    );
  }
}
