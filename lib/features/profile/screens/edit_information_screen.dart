import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_text_button_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/profile/widgets/custom_textfield_wd.dart';

class EditInformationScreen extends HookWidget {
  const EditInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final emailAddressController = useTextEditingController();
    final addressController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final isSavable = useState(false);
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        bottomNavigationBar: Padding(
          padding:
              EdgeInsetsGeometry.symmetric(horizontal: 25.r, vertical: 35.r),
          child: CustomTextButton(
            buttonText: texts.save,
            textColor: colors.ffffffff,
            backgroundColor:
                isSavable.value ? colors.ff007537 : colors.ff7D7B7B,
            func: () {},
          ),
        ),
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
                      .regular(color: colors.ff221fif, fontSize: 15.r),
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
                  children: [
                    CustomTextField(
                        controller: usernameController,
                        hint: texts.username,
                        func: (value) {
                          isSavable.value = value.isNotEmpty &&
                              emailAddressController.text.isNotEmpty &&
                              addressController.text.isNotEmpty &&
                              phoneNumberController.text.isNotEmpty;
                        }),
                    CustomTextField(
                        controller: emailAddressController,
                        hint: texts.emailHint,
                        func: (value) {
                          isSavable.value = value.isNotEmpty &&
                              usernameController.text.isNotEmpty &&
                              addressController.text.isNotEmpty &&
                              phoneNumberController.text.isNotEmpty;
                        }),
                    CustomTextField(
                        controller: addressController,
                        hint: texts.address,
                        func: (value) {
                          isSavable.value = value.isNotEmpty &&
                              usernameController.text.isNotEmpty &&
                              emailAddressController.text.isNotEmpty &&
                              phoneNumberController.text.isNotEmpty;
                        }),
                    CustomTextField(
                        controller: phoneNumberController,
                        hint: texts.phoneNumber,
                        func: (value) {
                          isSavable.value = value.isNotEmpty &&
                              usernameController.text.isNotEmpty &&
                              emailAddressController.text.isNotEmpty &&
                              addressController.text.isNotEmpty;
                        }),
                  ],
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
        texts.editInfo,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
    );
  }
}

