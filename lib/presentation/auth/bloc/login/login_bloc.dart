import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_events.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitial()) {
    on<OnLoginButtonClicked>(
      (event, emit) {
        emit(LoginLoading());

        
      },
    );
  }
}
