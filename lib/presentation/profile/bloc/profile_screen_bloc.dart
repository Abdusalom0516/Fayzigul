import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/presentation/profile/bloc/profile_screen_bloc_events.dart';
import 'package:plant_store/presentation/profile/bloc/profile_scren_bloc_states.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvents, ProfileScreenStates> {
  ProfileScreenBloc() : super(ProfileScreenInitialState()) {
    on<OnEditInformationNavigationClicked>((event, emit) {});

    on<OnPlantingGuideNavigationClicked>((event, emit) {});

    on<OnEditInformationNavigationClicked>((event, emit) {});

    on<OnTransactionsHistoryNavigationClicked>((event, emit) {});

    on<OnQaNavigationClicked>((event, emit) {});

    on<OnTermsAndSecurityNavigationClicked>((event, emit) {});

    on<OnSecurityoPolicyNavigationClicked>((event, emit) {});

    on<OnLogOutClicked>((event, emit) {});
  }
}
