import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:plant_store/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:plant_store/features/auth/domain/usecases/remove_user_usecase.dart';
import 'package:plant_store/features/auth/presentation/screens/login_screen.dart';
import 'package:plant_store/features/profile/bloc/profile_screen_bloc_events.dart';
import 'package:plant_store/features/profile/bloc/profile_scren_bloc_states.dart';
import 'package:plant_store/features/profile/screens/edit_information_screen.dart';
import 'package:plant_store/features/profile/screens/faqs_screen.dart';
import 'package:plant_store/features/profile/screens/planting_guides_screen.dart';
import 'package:plant_store/features/profile/screens/security_policy_screen.dart';
import 'package:plant_store/features/profile/screens/terms_and_policy_screen.dart';
import 'package:plant_store/features/profile/screens/transactions_history_screen.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvents, ProfileScreenStates> {
  ProfileScreenBloc() : super(ProfileScreenInitialState()) {
    on<OnEditInformationNavigationClicked>((event, emit) {
      AppRouter.go(EditInformationScreen());
    });

    on<OnPlantingGuideNavigationClicked>((event, emit) {
      AppRouter.go(PlantingGuidesScreen());
    });

    on<OnTransactionsHistoryNavigationClicked>((event, emit) {
      AppRouter.go(TransactionsHistoryScreen());
    });

    on<OnQaNavigationClicked>((event, emit) {
      AppRouter.go(FaqsScreen());
    });

    on<OnTermsAndSecurityNavigationClicked>((event, emit) {
      AppRouter.go(TermsAndPolicyScreen());
    });

    on<OnSecurityPolicyNavigationClicked>((event, emit) {
      AppRouter.go(SecurityPolicyScreen());
    });

    on<OnLogOutClicked>((event, emit) async {
      AuthRepositoryImplementation repository =
          AuthRepositoryImplementation(localDataSource: AuthLocalDataSource());

      final removeUserUseCase = RemoveUserUsecase(repository: repository);
      emit(ProfileScreenLoadingState());
      await Future.delayed(const Duration(seconds: 1));

      try {
        final auth = FirebaseAuth.instance;
        await auth.signOut();
        await removeUserUseCase();

        AppRouter.open(LoginScreen());
      } catch (e) {
        if (event.context.mounted) {
          log("Error during logout: $e");
          emit(ProfileScreenFailureState(
              "An error occurred while logging out. Please try again."));
          Toastification.error(
            event.context,
            "An error occurred while logging out. Please try again.",
          );
        }
      }
      emit(ProfileScreenSuccessState());
    });
  }
}
