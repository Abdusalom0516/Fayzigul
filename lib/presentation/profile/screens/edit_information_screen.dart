import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class EditInformationScreen extends StatelessWidget {
  const EditInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // Sliver Appbar Section
            appBarSection(colors, texts),
            SliverHeight(height: 15),
            // Info will be saved Section
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 25.r, vertical: 15.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  texts.infoWillSaved,
                  style: AppTextStyles.lato
                      .regular(color: colors.ff221fif, fontSize: 14.r),
                ),
              ),
            ),
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
              sliver: SliverToBoxAdapter(
                child: Column(
                  spacing: 15.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar appBarSection(ConstColors colors, ConstTexts texts) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      backgroundColor: colors.ffffffff,
      title: Text(
        texts.faqs,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
    );
  }
}
