import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/presentation/auth/bloc/sign_up/sign_up_events.dart';
import 'package:plant_store/presentation/auth/bloc/sign_up/sign_up_states.dart';
import 'package:plant_store/presentation/auth/screens/confirm_verification_screen.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnSignUpButtonClicked>(
      (event, emit) async {
        emit(SignUpLoading());
        final auth = FirebaseAuth.instance;

        final credential = await auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        if (credential.user != null) {
          emit(SignUpSuccess());
        }

        await credential.user?.sendEmailVerification();
        AppRouter.go(ConfirmVerificationScreen());
      },
    );
  }
}
