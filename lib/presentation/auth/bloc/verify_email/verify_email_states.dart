abstract class VerifyEmailStates {}

class VerifyEmailInitial extends VerifyEmailStates {}

class VerifyEmailLoading extends VerifyEmailStates {}

class VerifyEmailSuccess extends VerifyEmailStates {}

class VerifyEmailFailure extends VerifyEmailStates {
  String message;

  VerifyEmailFailure({required this.message});
}
