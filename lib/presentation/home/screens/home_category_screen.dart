import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class HomeCategoryScreen extends StatelessWidget {
  const HomeCategoryScreen({super.key, required this.categoryTitle});
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        backgroundColor: colors.ffffffff,
        body: CustomScrollView(
          slivers: [
            // Sliver App Bar Section
            SliverAppBar(
              title: Text(
                categoryTitle,
                style: AppTextStyles.lato.medium(
                  color: colors.ff221fif,
                  fontSize: 25.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
