// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/errors/firebase_auth_error_codes.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_events.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';
import 'package:plant_store/presentation/main/main_screen.dart';

class LoginBloc extends Bloc<LoginEvents, AuthStates> {
  LoginBloc() : super(LoginInitial()) {
    on<OnLoginButtonClicked>(
      (event, emit) async {
        emit(LoginLoading());

        final auth = FirebaseAuth.instance;

        try {
          final credential = await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          if (credential.user != null) {
            AppRouter.open(MainScreen());
            emit(LoginSuccess());
          }
        } on FirebaseAuthException catch (e) {
          emit(LoginFailure("Login Failed"));
          if (e.code == FirebaseAuthErrorCodes.loginErrorCodes.invalidEmail) {
            Toastification.error(event.context, "Email is Invalid.");
          } else if (e.code ==
              FirebaseAuthErrorCodes.loginErrorCodes.tooManyRequests) {
            Toastification.error(event.context, "Too many requests.");
          } else if (e.code ==
              FirebaseAuthErrorCodes.loginErrorCodes.userDisabled) {
            Toastification.error(event.context, "User is disabled.");
          } else if (e.code ==
              FirebaseAuthErrorCodes.loginErrorCodes.wrongPassword) {
            Toastification.error(event.context, "Password is incorrect.");
          } else {
            Toastification.error(event.context, "Failed to Login.");
          }
        }
      },
    );
  }
}
