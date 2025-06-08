abstract class VerifyEmailStates {}

class VerifyEmailInitial {}

class VerifyEmailLoading {}

class VerifyEmailSuccess {}

class VerifyEmailFailure {
  String message;

  VerifyEmailFailure({required this.message});
}
