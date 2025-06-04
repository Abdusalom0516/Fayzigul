abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  LoginSuccess();
}

class LoginFailure extends LoginStates {
  String message;

  LoginFailure(this.message);
}
