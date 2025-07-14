import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.func,
    required this.isChosen,
  });
  final String title;
  final VoidCallback func;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextButton(
        style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
        onPressed: func,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 5.r),
          decoration: BoxDecoration(
            color: isChosen ? colors.ff007537 : colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            title,
            style: AppTextStyles.lato.semiBold(
              color: !isChosen ? colors.ffababab : colors.ffffffff,
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    );
  }
}
