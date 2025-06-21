import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.title,
    required this.func,
    this.isRed = false,
  });
  final String title;
  final VoidCallback func;
  final bool isRed;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppStateWrapper(
        builder: (colors, texts, images) => TextButton(
          onPressed: func,
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            overlayColor: WidgetStatePropertyAll(colors.transparent),
          ),
          child: Container(
            height: 49.h,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 48.r),
            child: Text(
              title,
              style: AppTextStyles.lato.medium(
                color: isRed ? colors.ffff0000 : colors.ff221fif,
                fontSize: 19.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
