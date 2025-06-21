import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/utils/app_router.dart';
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

    on<OnLogOutClicked>((event, emit) {});
  }
}
