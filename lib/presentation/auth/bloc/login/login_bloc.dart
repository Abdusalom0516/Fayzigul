import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_events.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';
import 'package:plant_store/presentation/home/screens/home_screen.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitial()) {
    on<OnLoginButtonClicked>(
      (event, emit) async {
        emit(LoginLoading());

        final auth = FirebaseAuth.instance;

        if (auth.currentUser == null) {
          final credential = await auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          await credential.user?.sendEmailVerification();
        } else {
          final credential = await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          if (credential.user != null) {
            AppRouter.open(HomeScreen());
          }
        }
      },
    );

    on<OnReloadButtonClicked>(
      (event, emit) {
        final auth = FirebaseAuth.instance;
        final credentials = auth.currentUser;

        if (credentials != null) {
          if (credentials.emailVerified) {
          } else {
            log("Email is not verified");
          }
        }
      },
    );
  }
}
