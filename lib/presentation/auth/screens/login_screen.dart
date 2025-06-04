import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) => AppStateWrapper(
        builder: (colors, texts, images) => Scaffold(
          body: Column(
            children: [
              // Login Top Image Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      images.loginPlant,
                      fit: BoxFit.contain,
                      width: 375.w,
                      height: 391.h,
                    ),
                  ],
                ),
              ),
              Expanded(child: Column())
            ],
          ),
        ),
      ),
    );
  }
}
