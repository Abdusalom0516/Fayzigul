abstract class LoginEvents {}

class OnLoginButtonClicked extends LoginEvents {
  String email, password;

  OnLoginButtonClicked({required this.email, required this.password});
}

class OnReloadButtonClicked extends LoginEvents {}
