import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class TermsAndPolicyScreen extends StatelessWidget {
  const TermsAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBar Section
            appBarSection(colors, texts),
            // Coming Soon Text Section
            comingSoonTextSection(texts, colors),
          ],
        ),
      ),
    );
  }

  SliverFillRemaining comingSoonTextSection(
      ConstTexts texts, ConstColors colors) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(
          texts.comingSoon,
          style: AppTextStyles.lato
              .medium(color: colors.ff221fif, fontSize: 17.sp),
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
        texts.term,
        style:
            AppTextStyles.lato.medium(color: colors.ff221fif, fontSize: 23.sp),
      ),
    );
  }
}
