import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:plant_store/features/auth/data/models/user_model.dart';
import 'package:plant_store/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:plant_store/features/auth/domain/usecases/save_user_usecase.dart';
import 'package:plant_store/features/auth/presentation/blocs/verify_email/verify_email_events.dart';
import 'package:plant_store/features/auth/presentation/blocs/verify_email/verify_email_states.dart';
import 'package:plant_store/features/main/main_screen.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvents, VerifyEmailStates> {
  VerifyEmailBloc() : super(VerifyEmailInitial()) {
    AuthRepositoryImplementation repository =
        AuthRepositoryImplementation(localDataSource: AuthLocalDataSource());
    final saveUserUsecase = SaveUserUsecase(repository: repository);
    on<OnCheckVerifiedClicked>(
      (event, emit) async {
        emit(VerifyEmailLoading());
        final auth = FirebaseAuth.instance;

        if (auth.currentUser != null) {
          await auth.currentUser!.reload();
          final user = FirebaseAuth.instance.currentUser;

          if (auth.currentUser!.emailVerified && user != null) {
            await saveUserUsecase(
                user: UserModel(
              uid: user.uid,
              email: user.email,
              displayName: user.displayName,
              emailVerified: user.emailVerified,
              isAnonymous: user.isAnonymous,
              phoneNumber: user.phoneNumber,
              photoURL: user.photoURL,
              refreshToken: user.refreshToken,
              tenanId: user.tenantId,
              creationTime: user.metadata.creationTime,
              lastSignInTime: user.metadata.lastSignInTime,
            ));
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
