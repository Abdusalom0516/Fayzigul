import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class EquipmentsCard extends StatelessWidget {
  const EquipmentsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => SizedBox(
        child: Column(
          spacing: 2.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.fff6f6f6,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                images.equipment,
                height: 134.h,
                width: 155.w,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "Spider Plant",
                    style: AppTextStyles.lato.medium(
                      color: colors.ff221fif,
                      fontSize: 19.sp,
                    ),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "\$250",
                    style: AppTextStyles.lato.medium(
                      color: colors.ff007537,
                      fontSize: 19.sp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
