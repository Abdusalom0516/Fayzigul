import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class ProdDetCategoryCard extends StatelessWidget {
  const ProdDetCategoryCard({
    super.key,
    required this.categoryTitle,
  });
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: colors.ff007537,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          categoryTitle.substring(0, 1).toUpperCase() +
              categoryTitle.substring(1).toLowerCase(),
          style: AppTextStyles.lato
              .medium(color: colors.ffffffff, fontSize: 17.sp),
        ),
      ),
    );
  }
}
