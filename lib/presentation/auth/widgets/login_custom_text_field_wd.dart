import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class AuthCustomTextField extends StatelessWidget {
  const AuthCustomTextField({
    super.key,
    required this.controller,
    required this.primaryFocusNode,
    required this.isTyping,
    required this.secondaryFocusNode,
    required this.hint,
  });

  final TextEditingController controller;
  final FocusNode primaryFocusNode;
  final ValueNotifier<bool> isTyping;
  final FocusNode secondaryFocusNode;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colors.ffababab.withValues(alpha: 0.5),
              width: 1.3.w,
            ),
          ),
        ),
        child: TextField(
          controller: controller,
          focusNode: primaryFocusNode,
          onTap: () => isTyping.value = true,
          onTapOutside: (event) {
            primaryFocusNode.unfocus();
            secondaryFocusNode.unfocus();
            isTyping.value = false;
          },
          cursorColor: colors.ff221fif,
          style: AppTextStyles.lato
              .regular(
                color: colors.ff221fif,
                fontSize: 16.sp,
              )
              .copyWith(
                decoration: TextDecoration.none,
                decorationColor: colors.transparent,
                decorationThickness: 0,
              ),
          decoration: InputDecoration(
            hint: Text(
              hint,
              style: AppTextStyles.lato.regular(
                color: colors.ffababab,
                fontSize: 16.sp,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
