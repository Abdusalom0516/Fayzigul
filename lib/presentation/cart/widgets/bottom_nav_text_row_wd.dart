import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class BottomNavigationTextRow extends StatelessWidget {
  const BottomNavigationTextRow(
      {super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Row(
        spacing: 15.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.lato.medium(
              color: colors.ff221fif,
              fontSize: 17.sp,
            ),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              value,
              style: AppTextStyles.lato.semiBold(
                color: colors.ff007537,
                fontSize: 17.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
