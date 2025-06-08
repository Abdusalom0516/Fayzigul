import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/verify_email/verify_email_events.dart';
import 'package:plant_store/presentation/auth/bloc/verify_email/verify_email_states.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvents, VerifyEmailStates> {
  VerifyEmailBloc() : super(VerifyEmailInitial()) {
    on<OnCheckVerifiedClicked>(
      (event, emit) {},
    );
  }
}
