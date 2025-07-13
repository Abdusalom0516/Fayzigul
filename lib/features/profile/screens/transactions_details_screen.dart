import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_text_button_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/cart/data/models/transactions_model.dart';
import 'package:plant_store/features/cart/presentation/widgets/bottom_nav_text_row_wd.dart';
import 'package:plant_store/features/cart/presentation/widgets/checkout_items_card_wd.dart';
import 'package:plant_store/features/main/main_screen.dart';

class TransactionsDetailsScreen extends StatelessWidget {
  const TransactionsDetailsScreen({super.key, required this.transactionsModel});
  final TransactionsModel transactionsModel;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        // Bottom Section
        bottomNavigationBar: bottomSection(
            products: transactionsModel.products, texts: texts, colors: colors),
        body: CustomScrollView(
          slivers: [
            // Sliver Appbar Section
            appBarSection(colors, texts),
            SliverHeight(height: 15),
            // Your Items Title Section
            sectionsTitleSection(colors, texts.yourItems),
            SliverHeight(height: 5),
            yourItemsSection(checkoutProducts: transactionsModel.products),
            SliverHeight(height: 35),
            // Personal Information Title Section
            sectionsTitleSection(colors, texts.personalInfo),
            SliverHeight(height: 15),
            // Personal Information TextField Section
            personalInformationDataSection(colors),
            SliverHeight(height: 45),
            // Payment Method Title Section
            sectionsTitleSection(colors, texts.paymentMethod),
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
              sliver: SliverToBoxAdapter(
                child: Column(
                  spacing: 15.r,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactionsModel.paymentMethod,
                      style: AppTextStyles.lato.medium(
                        color: colors.ff7D7B7B,
                        fontSize: 19.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverHeight(height: 35),
          ],
        ),
      ),
    );
  }

  SliverPadding personalInformationDataSection(ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
      sliver: SliverToBoxAdapter(
        child: Column(
          spacing: 15.r,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transactionsModel.username,
              style: AppTextStyles.lato.medium(
                color: colors.ff7D7B7B,
                fontSize: 19.sp,
              ),
            ),
            Text(
              transactionsModel.email,
              style: AppTextStyles.lato.medium(
                color: colors.ff7D7B7B,
                fontSize: 19.sp,
              ),
            ),
            Text(
              transactionsModel.address,
              style: AppTextStyles.lato.medium(
                color: colors.ff7D7B7B,
                fontSize: 19.sp,
              ),
            ),
            Text(
              transactionsModel.phoneNumber,
              style: AppTextStyles.lato.medium(
                color: colors.ff7D7B7B,
                fontSize: 19.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomSection(
      {required ConstTexts texts,
      required List<CartProductModel> products,
      required ConstColors colors}) {
    double sum = 0;
    for (var elem in products) {
      sum += (elem.product.price * elem.productQuantity);
    }
    return Container(
      height: 157.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 24.w),
      decoration: BoxDecoration(color: colors.ffffffff),
      child: Column(
        spacing: 15.r,
        children: [
          BottomNavigationTextRow(title: texts.youPaid, value: sum + 19),
          CustomTextButton(
              buttonText: texts.backtoHomePage,
              textColor: colors.ffffffff,
              backgroundColor: colors.ff007537,
              func: () {
                AppRouter.open(MainScreen());
              })
        ],
      ),
    );
  }

  SliverList yourItemsSection(
      {required List<CartProductModel> checkoutProducts}) {
    return SliverList.builder(
      itemCount: checkoutProducts.length,
      itemBuilder: (context, index) => CheckoutItemsCard(
        cartProductModel: checkoutProducts[index],
      ),
    );
  }

  SliverPadding sectionsTitleSection(ConstColors colors, String title) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
      sliver: SliverToBoxAdapter(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.r),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colors.ff221fif, width: 1.r),
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.lato.medium(
              color: colors.ff221fif,
              fontSize: 19.sp,
            ),
          ),
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
        texts.transactionsHistory,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
    );
  }
}
