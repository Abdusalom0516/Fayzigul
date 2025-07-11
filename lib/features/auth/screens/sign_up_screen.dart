import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_text_button_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/auth/bloc/login/login_bloc.dart';
import 'package:plant_store/features/auth/bloc/login/login_states.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plant_store/features/auth/bloc/sign_up/sign_up_bloc.dart';
import 'package:plant_store/features/auth/bloc/sign_up/sign_up_events.dart';
import 'package:plant_store/features/auth/bloc/sign_up/sign_up_states.dart';
import 'package:plant_store/features/auth/screens/login_screen.dart';
import 'package:plant_store/features/auth/widgets/login_custom_text_field_wd.dart';

class SignUpScren extends HookWidget {
  const SignUpScren({super.key});

  @override
  Widget build(BuildContext context) {
    final isTyping = useState(false);
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final isInvalidEmail = useState(false);
    final isInvalidPassword = useState(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return BlocBuilder<LoginBloc, AuthStates>(
      builder: (context, loginState) => BlocBuilder<SignUpBloc, SignUpStates>(
        builder: (context, signUpState) => AppStateWrapper(
          builder: (colors, texts, images) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: loginState is LoginLoading || signUpState is SignUpLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: colors.ff007537,
                    ),
                  )
                : Column(
                    children: [
                      // Sign Up Top Image Section
                      !isTyping.value
                          ? Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    images.loginPlant,
                                    fit: BoxFit.cover,
                                    width: 375.w,
                                    height: 345.h,
                                  ),
                                ],
                              ),
                            )
                          : Height(height: 55),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 45.r,
                          ),
                          child: Column(
                            children: [
                              Height(height: 13),
                              // Sign Up App Name Section
                              signUpAppNameSection(texts, colors),
                              Height(height: 25),
                              // Sign Up Sub Text Section
                              signUpSubTextSection(texts, colors),
                              Height(height: 7),
                              // Sign Up Email TextField Section
                              AuthCustomTextField(
                                controller: emailController,
                                primaryFocusNode: emailFocusNode,
                                isTyping: isTyping,
                                secondaryFocusNode: passwordFocusNode,
                                hint: texts.emailHint,
                              ),
                              Height(height: 5),
                              // Sign Up Email Invalid Section
                              isInvalidEmail.value
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          texts.emailInvalid,
                                          style: AppTextStyles.lato.bold(
                                            color: colors.ffff0000,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              Height(height: 7),
                              // Sign Up Password TextField Section
                              AuthCustomTextField(
                                controller: passwordController,
                                primaryFocusNode: passwordFocusNode,
                                isTyping: isTyping,
                                secondaryFocusNode: emailFocusNode,
                                hint: texts.passwordHint,
                              ),
                              Height(height: 5),
                              // Sign Up Password Invalid Section
                              isInvalidPassword.value
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          texts.passwordInvalid,
                                          style: AppTextStyles.lato.bold(
                                            color: colors.ffff0000,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              Height(height: 15),
                              // Sign Up Button
                              CustomTextButton(
                                buttonText: texts.register,
                                textColor: colors.ffffffff,
                                backgroundColor: colors.ff221fif,
                                func: () {
                                  context.read<SignUpBloc>().add(
                                        OnSignUpButtonClicked(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                          context: context,
                                        ),
                                      );
                                },
                              ),
                              Height(height: 5),
                              // Sign Up Not Now Text Section
                              signUpBottomNavigationTextSection(colors, texts),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  TextButton signUpBottomNavigationTextSection(
      ConstColors colors, ConstTexts texts) {
    return TextButton(
      onPressed: () {
        AppRouter.open(LoginScreen());
      },
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(colors.transparent),
      ),
      child: Row(
        spacing: 7.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(texts.doNotHaveAnAccount,
              style: AppTextStyles.lato.regular(
                color: colors.ff221fif,
                fontSize: 16.sp,
              )),
          Text(
            texts.login,
            style: AppTextStyles.lato
                .regular(
                  color: colors.ff221fif,
                  fontSize: 16.sp,
                )
                .copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: colors.ff221fif,
                  decorationThickness: 1.5.r,
                ),
          ),
        ],
      ),
    );
  }

  Text signUpSubTextSection(ConstTexts texts, ConstColors colors) {
    return Text(
      textAlign: TextAlign.center,
      texts.loginSubText,
      style: AppTextStyles.lato.regular(
        color: colors.ff221fif,
        fontSize: 14.sp,
      ),
    );
  }

  Text signUpAppNameSection(ConstTexts texts, ConstColors colors) {
    return Text(
      texts.appName,
      style: AppTextStyles.lato.bold(
        color: colors.ff007537,
        fontSize: 37.sp,
      ),
    );
  }
}
