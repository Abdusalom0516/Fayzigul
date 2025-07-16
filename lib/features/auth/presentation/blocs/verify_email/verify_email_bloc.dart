import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/features/auth/presentation/blocs/verify_email/verify_email_events.dart';
import 'package:plant_store/features/auth/presentation/blocs/verify_email/verify_email_states.dart';
import 'package:plant_store/features/main/main_screen.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvents, VerifyEmailStates> {
  VerifyEmailBloc() : super(VerifyEmailInitial()) {
    on<OnCheckVerifiedClicked>(
      (event, emit) async {
        emit(VerifyEmailLoading());
        final auth = FirebaseAuth.instance;

        if (auth.currentUser != null) {
          await auth.currentUser!.reload();

          if (auth.currentUser!.emailVerified) {
            if (event.context.mounted) {
              Toastification.success(
                  event.context, "Email Verified Succesfully");
            }
            AppRouter.open(MainScreen());
            emit(VerifyEmailSuccess());
          } else {
            emit(VerifyEmailFailure(message: "Email not verified."));
            if (event.context.mounted) {
              Toastification.error(event.context, "Email not verified.");
            }
          }
        }
      },
    );
  }
}
