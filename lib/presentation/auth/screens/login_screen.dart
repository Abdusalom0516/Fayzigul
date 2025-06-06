import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_text_button.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plant_store/presentation/auth/widgets/login_custom_text_field.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTyping = useState(false);
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final isInvalidEmail = useState(false);
    final isInvalidPassword = useState(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) => AppStateWrapper(
        builder: (colors, texts, images) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              // Login Top Image Section
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
                      // Login App Name Section
                      loginAppNameSection(texts, colors),
                      Height(height: 25),
                      // Login Sub Text Section
                      loginSubTextSection(texts, colors),
                      Height(height: 7),
                      // Login Email TextField Section
                      LoginCustomTextField(
                        controller: emailController,
                        primaryFocusNode: emailFocusNode,
                        isTyping: isTyping,
                        secondaryFocusNode: passwordFocusNode,
                        hint: texts.emailHint,
                      ),
                      Height(height: 5),
                      // Login Email Invalid Section
                      isInvalidEmail.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                      // Login Password TextField Section
                      LoginCustomTextField(
                        controller: passwordController,
                        primaryFocusNode: passwordFocusNode,
                        isTyping: isTyping,
                        secondaryFocusNode: emailFocusNode,
                        hint: texts.passwordHint,
                      ),
                      Height(height: 5),
                      // Login Password Invalid Section
                      isInvalidPassword.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                      // Login / Register Button
                      CustomTextButton(
                        buttonText: texts.loginRegister,
                        textColor: colors.ffffffff,
                        backgroundColor: colors.ff221fif,
                        func: () {},
                      ),
                      Height(height: 5),
                      // Login Not Now Text Section
                      loginNotNowtextSection(colors, texts),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextButton loginNotNowtextSection(ConstColors colors, ConstTexts texts) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(colors.transparent),
      ),
      child: Text(
        texts.notNow,
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
    );
  }

  Text loginSubTextSection(ConstTexts texts, ConstColors colors) {
    return Text(
      textAlign: TextAlign.center,
      texts.loginSubText,
      style: AppTextStyles.lato.regular(
        color: colors.ff221fif,
        fontSize: 14.sp,
      ),
    );
  }

  Text loginAppNameSection(ConstTexts texts, ConstColors colors) {
    return Text(
      texts.appName,
      style: AppTextStyles.lato.bold(
        color: colors.ff007537,
        fontSize: 37.sp,
      ),
    );
  }
}
