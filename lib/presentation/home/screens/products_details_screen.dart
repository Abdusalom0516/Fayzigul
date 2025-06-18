import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

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
          ],
        ),
      ),
    );
  }
}
