abstract class ProfileScreenStates {}

class ProfileScreenInitialState extends ProfileScreenStates {}

class ProfileScreenLoadingState extends ProfileScreenStates {}

class ProfileScreenSuccessState extends ProfileScreenStates {}

class ProfileScreenFailureState extends ProfileScreenStates {
  final String errorMessage;

  ProfileScreenFailureState(this.errorMessage);
}
