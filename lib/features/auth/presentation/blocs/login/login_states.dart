abstract class AuthStates {}

class LoginInitial extends AuthStates {}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  LoginSuccess();
}

class LoginFailure extends AuthStates {
  String message;

  LoginFailure(this.message);
}
