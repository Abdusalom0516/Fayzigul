import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/widgets/custom_text_button.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/auth/bloc/verify_email/verify_email_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/verify_email/verify_email_states.dart';

class ConfirmVerificationScreen extends StatelessWidget {
  const ConfirmVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) =>
          BlocBuilder<VerifyEmailBloc, VerifyEmailStates>(
        builder: (context, state) => Scaffold(
          body: state is VerifyEmailLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: colors.ff007537,
                  ),
                )
              : Column(
                  spacing: 35.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      texts.confirmVerification,
                      style: AppTextStyles.lato.medium(
                        color: colors.ff221fif,
                        fontSize: 21.sp,
                      ),
                    ),
                    SizedBox(
                      width: 155.w,
                      child: CustomTextButton(
                        buttonText: texts.confirm,
                        textColor: colors.ffffffff,
                        backgroundColor: colors.ff007537,
                        func: () {},
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
