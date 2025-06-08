import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:plant_store/presentation/auth/bloc/login/login_events.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plant_store/presentation/auth/bloc/sign_up/sign_up_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/sign_up/sign_up_events.dart';
import 'package:plant_store/presentation/auth/bloc/sign_up/sign_up_states.dart';
import 'package:plant_store/presentation/auth/bloc/verify_email/verify_email_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/verify_email/verify_email_states.dart';
import 'package:plant_store/presentation/auth/widgets/login_custom_text_field.dart';

class AuthScreen extends HookWidget {
  const AuthScreen({super.key});

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
        builder: (context, signUpState) =>
            BlocBuilder<VerifyEmailBloc, VerifyEmailStates>(
          builder: (context, verifyEmailState) => AppStateWrapper(
            builder: (colors, texts, images) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: loginState is LoginLoading
                  ? SizedBox(
                      width: double.infinity,
                      child: Column(
                        spacing: 85.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          CircularProgressIndicator(
                            color: colors.ff007537,
                          ),
                          SizedBox(
                            width: 155.w,
                            child: CustomTextButton(
                              buttonText: texts.reload,
                              textColor: colors.ffffffff,
                              backgroundColor: colors.ff007537,
                              func: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        // Auth Top Image Section
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
                                // Auth App Name Section
                                authAppNameSection(texts, colors),
                                Height(height: 25),
                                // Auth Sub Text Section
                                authSubTextSection(texts, colors),
                                Height(height: 7),
                                // Auth Email TextField Section
                                AuthCustomTextField(
                                  controller: emailController,
                                  primaryFocusNode: emailFocusNode,
                                  isTyping: isTyping,
                                  secondaryFocusNode: passwordFocusNode,
                                  hint: texts.emailHint,
                                ),
                                Height(height: 5),
                                // Auth Email Invalid Section
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
                                // Auth Password TextField Section
                                AuthCustomTextField(
                                  controller: passwordController,
                                  primaryFocusNode: passwordFocusNode,
                                  isTyping: isTyping,
                                  secondaryFocusNode: emailFocusNode,
                                  hint: texts.passwordHint,
                                ),
                                Height(height: 5),
                                // Auth Password Invalid Section
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
                                // Auth / Register Button
                                CustomTextButton(
                                  buttonText: texts.loginRegister,
                                  textColor: colors.ffffffff,
                                  backgroundColor: colors.ff221fif,
                                  func: () async {
                                    final auth = FirebaseAuth.instance;

                                    final methods =
                                        // ignore: deprecated_member_use
                                        await auth.fetchSignInMethodsForEmail(
                                            emailController.text.trim());

                                    if (methods.isNotEmpty) {
                                      if (context.mounted) {
                                        context.read<LoginBloc>().add(
                                              OnLoginButtonClicked(
                                                email:
                                                    emailController.text.trim(),
                                                password: passwordController
                                                    .text
                                                    .trim(),
                                              ),
                                            );
                                      }
                                    } else {
                                      if (context.mounted) {
                                        context.read<SignUpBloc>().add(
                                              OnSignUpButtonClicked(
                                                email:
                                                    emailController.text.trim(),
                                                password: passwordController
                                                    .text
                                                    .trim(),
                                                context: context,
                                              ),
                                            );
                                      }
                                    }
                                  },
                                ),
                                Height(height: 5),
                                // Auth Not Now Text Section
                                authNotNowtextSection(colors, texts),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton authNotNowtextSection(ConstColors colors, ConstTexts texts) {
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

  Text authSubTextSection(ConstTexts texts, ConstColors colors) {
    return Text(
      textAlign: TextAlign.center,
      texts.loginSubText,
      style: AppTextStyles.lato.regular(
        color: colors.ff221fif,
        fontSize: 14.sp,
      ),
    );
  }

  Text authAppNameSection(ConstTexts texts, ConstColors colors) {
    return Text(
      texts.appName,
      style: AppTextStyles.lato.bold(
        color: colors.ff007537,
        fontSize: 37.sp,
      ),
    );
  }
}
