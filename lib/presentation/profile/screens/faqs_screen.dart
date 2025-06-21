import 'package:flutter/material.dart';
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
                texts.cart,
                style: AppTextStyles.lato.medium(
                  color: colors.ff221fif,
                  fontSize: 23.sp,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 48.r, vertical: 15.r),
              sliver: SliverToBoxAdapter(
                child: ExpansionTile(
                  title: Text(
                    texts.howLongArrive,
                    style: AppTextStyles.lato
                        .medium(color: colors.ff221fif, fontSize: 16.sp),
                  ),
                  children: [
                    Text(
                      texts.howLongArriveAns,
                      style: AppTextStyles.lato
                          .regular(color: colors.ff7D7B7B, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
