import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_expansion_tile_wd.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // Sliver Appbar Section
            appBarSection(colors, texts),
            SliverHeight(height: 15),
            // Qustion and Answer Section
            CustomExpansionTile(
              quastion: texts.howLongArrive,
              answer: texts.howLongArriveAns,
            ),
            SliverHeight(height: 5),
            CustomExpansionTile(
              quastion: texts.whereShip,
              answer: texts.whereShipAns,
            ),
            SliverHeight(height: 5),
            CustomExpansionTile(
              quastion: texts.ifOrderMultiple,
              answer: texts.ifOrderMultipleAns,
            ),
            SliverHeight(height: 5),
            CustomExpansionTile(
              quastion: texts.howToOrderDifferentPlace,
              answer: texts.howToOrderDifferentPlaceAns,
            ),
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
