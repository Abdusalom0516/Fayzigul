import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_events.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitial()) {
    on<OnLoginButtonClicked>(
      (event, emit) async {
        emit(LoginLoading());

        final auth = FirebaseAuth.instance;

        try {
          final credential = await auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          await credential.user?.sendEmailVerification();
        } on FirebaseAuthException catch (e) {
          emit(LoginFailure(
              e.message ?? "Error Occured on Auth Login / Register."));
        } catch (e) {
          emit(LoginFailure(e.toString()));
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
            
          }
        }
      },
    );
  }
}
