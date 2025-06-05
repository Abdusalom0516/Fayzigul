import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/widgets/custom_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTyping = useState(false);
    final focusNode = useFocusNode();
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
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            images.loginPlant,
                            fit: BoxFit.cover,
                            width: 375.w,
                            height: 310.h,
                          ),
                        ],
                      ),
                    )
                  : Height(height: 55),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 45.r,
                    vertical: 25.r,
                  ),
                  child: Column(
                    children: [
                      // Login App Name Section
                      Text(
                        texts.appName,
                        style: AppTextStyles.lato.bold(
                          color: colors.ff007537,
                          fontSize: 37.sp,
                        ),
                      ),
                      Height(height: 25),
                      // Login Sub Text Section
                      Text(
                        textAlign: TextAlign.center,
                        texts.loginSubText,
                        style: AppTextStyles.lato.regular(
                          color: colors.ff221fif,
                          fontSize: 14.sp,
                        ),
                      ),
                      Height(height: 7),
                      // Login Email TextField Section
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: colors.ffababab.withValues(alpha: 0.5),
                              width: 1.3.w,
                            ),
                          ),
                        ),
                        child: TextField(
                          focusNode: focusNode,
                          onTap: () => isTyping.value = true,
                          onTapOutside: (event) {
                            focusNode.unfocus();
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
                              texts.emailHint,
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: colors.ffababab.withValues(alpha: 0.5),
                              width: 1.3.w,
                            ),
                          ),
                        ),
                        child: TextField(
                          focusNode: focusNode,
                          onTap: () => isTyping.value = true,
                          onTapOutside: (event) {
                            focusNode.unfocus();
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
                              texts.passwordHint,
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
                      Height(height: 5),
                      // Login Password Invalid Section
                      isInvalidEmail.value
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
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.zero),
                        ),
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: colors.ff221fif,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            texts.loginRegister,
                            style: AppTextStyles.lato.regular(
                              color: colors.ffffffff,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      Height(height: 5),
                      // Login Not Now Text Section
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          overlayColor:
                              WidgetStatePropertyAll(colors.transparent),
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
                      ),
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
}
