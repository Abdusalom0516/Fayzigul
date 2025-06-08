import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_events.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';
import 'package:plant_store/presentation/home/screens/home_screen.dart';

class LoginBloc extends Bloc<LoginEvents, AuthStates> {
  LoginBloc() : super(LoginInitial()) {
    on<OnLoginButtonClicked>(
      (event, emit) async {
        emit(LoginLoading());

        final auth = FirebaseAuth.instance;

        final credential = await auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        if (credential.user != null) {
          emit(LoginSuccess());
          AppRouter.open(HomeScreen());
        }
      },
    );
  }
}
