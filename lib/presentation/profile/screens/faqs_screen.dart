import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
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
            ),
            CustomExpansionTile(
              quastion: texts.howLongArrive,
              answer: texts.howLongArriveAns,
            ),
            CustomExpansionTile(
              quastion: texts.whereShip,
              answer: texts.whereShipAns,
            ),
            CustomExpansionTile(
              quastion: texts.ifOrderMultiple,
              answer: texts.ifOrderMultipleAns,
            ),
            CustomExpansionTile(
              quastion: texts.howToOrderDifferentPlace,
              answer: texts.howToOrderDifferentPlaceAns,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomExpansionTile extends HookWidget {
  const CustomExpansionTile(
      {super.key, required this.quastion, required this.answer});
  final String quastion, answer;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 7.r),
      sliver: SliverToBoxAdapter(
        child: AppStateWrapper(
          builder: (colors, texts, images) => ExpansionTile(
            backgroundColor: colors.fff6f6f6,
            onExpansionChanged: (value) {
              isExpanded.value = value;
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            childrenPadding:
                EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
            trailing: Icon(
                !isExpanded.value
                    ? Icons.keyboard_arrow_down_rounded
                    : Icons.keyboard_arrow_up_rounded,
                size: 25.r,
                color: colors.ff221fif),
            title: Text(
              quastion,
              style: AppTextStyles.lato
                  .medium(color: colors.ff221fif, fontSize: 16.sp),
            ),
            children: [
              Text(
                answer,
                style: AppTextStyles.lato
                    .regular(color: colors.ff7D7B7B, fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
