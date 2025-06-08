abstract class SignUpEvents {}

class OnSignUpButtonClicked extends SignUpEvents {
  String email, password;

  OnSignUpButtonClicked({required this.email, required this.password});
}
