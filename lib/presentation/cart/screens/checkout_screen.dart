import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/cart/widgets/checkout_items_card_wd.dart';
import 'package:plant_store/presentation/profile/widgets/custom_textfield_wd.dart';

class CheckoutScreen extends HookWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final emailAddressController = useTextEditingController();
    final addressController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // App Bar Section
            appBarSection(colors, texts),
            SliverHeight(height: 15),
            // Personal Information Title Section
            sectionsTitleSection(colors, texts.personalInfo),
            SliverHeight(height: 5),
            // Personal Information TextField Section
            personalInformationTextFieldSection(
              usernameController,
              texts,
              emailAddressController,
              addressController,
              phoneNumberController,
            ),
            SliverHeight(height: 25),
            // Payment Method Title Section
            sectionsTitleSection(colors, texts.paymentMethod),

            SliverHeight(height: 25),
            // Your Items Title Section
            sectionsTitleSection(colors, texts.yourItems),
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) => CheckoutItemsCard(),
            ),
            SliverHeight(height: 35),
          ],
        ),
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
              fontSize: 17.sp,
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
