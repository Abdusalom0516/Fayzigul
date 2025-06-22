import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/presentation/profile/bloc/profile_screen_bloc_events.dart';
import 'package:plant_store/presentation/profile/bloc/profile_scren_bloc_states.dart';
import 'package:plant_store/presentation/profile/screens/edit_information_screen.dart';
import 'package:plant_store/presentation/profile/screens/faqs_screen.dart';
import 'package:plant_store/presentation/profile/screens/transactions_history_screen.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvents, ProfileScreenStates> {
  ProfileScreenBloc() : super(ProfileScreenInitialState()) {
    on<OnEditInformationNavigationClicked>((event, emit) {
      AppRouter.go(EditInformationScreen());
    });

    on<OnPlantingGuideNavigationClicked>((event, emit) {});

    on<OnTransactionsHistoryNavigationClicked>((event, emit) {
      AppRouter.go(TransactionsHistoryScreen());
    });

    on<OnQaNavigationClicked>((event, emit) {
      AppRouter.go(FaqsScreen());
    });

    on<OnTermsAndSecurityNavigationClicked>((event, emit) {});

    on<OnSecurityPolicyNavigationClicked>((event, emit) {});

    on<OnLogOutClicked>((event, emit) async {
      emit(ProfileScreenLoadingState());
      log("Logging out...");
      await Future.delayed(const Duration(seconds: 1));
      try {
        final auth = FirebaseAuth.instance;
        await auth.signOut();

        if (event.context.mounted) {
          log("User logged out successfully.");
          Phoenix.rebirth(event.context);
          // await Restart.restartApp();
        } else {
          log("Context is not mounted, cannot navigate.");
        }
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
