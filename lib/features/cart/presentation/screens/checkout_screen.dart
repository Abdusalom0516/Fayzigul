import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_text_button_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/cart/presentation/widgets/bottom_nav_text_row_wd.dart';
import 'package:plant_store/features/cart/presentation/widgets/checkout_items_card_wd.dart';
import 'package:plant_store/features/cart/presentation/widgets/payment_method_card_wd.dart';
import 'package:plant_store/features/profile/widgets/custom_textfield_wd.dart';

class CheckoutScreen extends HookWidget {
  const CheckoutScreen({super.key, required this.checkoutProducts});
  final List<CartProductModel> checkoutProducts;

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final emailAddressController = useTextEditingController();
    final addressController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final payWithCash = useState(true);
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        bottomNavigationBar: bottomNavigationSection(
            checkoutProducts: checkoutProducts, colors: colors, texts: texts),
        body: CustomScrollView(
          slivers: [
            // App Bar Section
            appBarSection(colors, texts),
            SliverHeight(height: 15),
            // Your Items Title Section
            sectionsTitleSection(colors, texts.yourItems),
            SliverHeight(height: 5),
            yourItemsSection(checkoutProducts: checkoutProducts),
            SliverHeight(height: 35),
            // Personal Information Title Section
            sectionsTitleSection(colors, texts.personalInfo),
            SliverHeight(height: 15),
            // Personal Information TextField Section
            personalInformationTextFieldSection(
              usernameController,
              texts,
              emailAddressController,
              addressController,
              phoneNumberController,
            ),
            SliverHeight(height: 45),
            // Payment Method Title Section
            sectionsTitleSection(colors, texts.paymentMethod),
            SliverHeight(height: 15),
            paymentMethodsSection(payWithCash, texts),
            SliverHeight(height: 35),
          ],
        ),
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

  SliverPadding paymentMethodsSection(
      ValueNotifier<bool> payWithCash, ConstTexts texts) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            PaymentMethodCard(
              payWithCash: payWithCash,
              methodTitle: texts.cash,
              func: (value) {
                payWithCash.value = true;
              },
            ),
            PaymentMethodCard(
              payWithCash: payWithCash,
              methodTitle: texts.card,
              func: (value) {
                payWithCash.value = false;
              },
            ),
          ],
        ),
      ),
    );
  }

  Container bottomNavigationSection(
      {required List<CartProductModel> checkoutProducts,
      required ConstTexts texts,
      required ConstColors colors}) {
    double sum = 0;
    for (var elem in checkoutProducts) {
      sum += (elem.product.price * elem.productQuantity);
    }
    return Container(
      height: 165.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 15.r),
      margin: EdgeInsets.only(bottom: 55.r),
      child: Column(
        spacing: 15.h,
        children: [
          Column(
            spacing: 5.h,
            children: [
              BottomNavigationTextRow(title: texts.subtotal, value: "\$$sum"),
              BottomNavigationTextRow(title: texts.deliveryFee, value: "\$19"),
              BottomNavigationTextRow(
                  title: texts.total, value: "\$${sum + 19}"),
            ],
          ),
          CustomTextButton(
            buttonText: texts.continueT,
            textColor: colors.ffffffff,
            backgroundColor: colors.ff007537,
            func: () {
              log("Continue Button Clicked.");
            },
          )
        ],
      ),
    );
  }

  SliverPadding personalInformationTextFieldSection(
      TextEditingController usernameController,
      ConstTexts texts,
      TextEditingController emailAddressController,
      TextEditingController addressController,
      TextEditingController phoneNumberController) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
      sliver: SliverToBoxAdapter(
        child: Column(
          spacing: 5.h,
          children: [
            CustomTextField(
                controller: usernameController,
                hint: texts.username,
                func: (text) {}),
            CustomTextField(
                controller: emailAddressController,
                hint: texts.emailHint,
                func: (text) {}),
            CustomTextField(
                controller: addressController,
                hint: texts.address,
                func: (text) {}),
            CustomTextField(
                controller: phoneNumberController,
                hint: texts.phoneNumber,
                func: (text) {}),
          ],
        ),
      ),
    );
  }

  SliverPadding sectionsTitleSection(ConstColors colors, String title) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
      sliver: SliverToBoxAdapter(
        child: Container(
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
        texts.checkout,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
    );
  }
}
