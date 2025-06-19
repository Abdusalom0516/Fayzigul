import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    super.key,
    required this.keyword,
    required this.value,
    this.isValueGreen = false,
  });
  final String keyword, value;
  final bool isValueGreen;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 3.5.r),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colors.ff221fif,
              width: 1.1.r,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              keyword,
              style: AppTextStyles.lato.regular(
                color: colors.ff3A3A3A,
                fontSize: 17.5.sp,
              ),
            ),
            Text(
              value,
              style: isValueGreen
                  ? AppTextStyles.lato.medium(
                      color: colors.ff007537,
                      fontSize: 17.5.sp,
                    )
                  : AppTextStyles.lato.regular(
                      color: colors.ff3A3A3A,
                      fontSize: 17.5.sp,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
