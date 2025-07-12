import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class CustomEmptyCenterText extends StatelessWidget {
  const CustomEmptyCenterText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: AppStateWrapper(
        builder: (colors, texts, images) => Center(
          child: Text(
            text,
            style: AppTextStyles.lato.medium(
              color: colors.ff221fif,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
