import 'package:flutter/widgets.dart';

abstract class SignUpEvents {}

class OnSignUpButtonClicked extends SignUpEvents {
  String email, password;
  BuildContext context;

  OnSignUpButtonClicked({required this.email, required this.password, required this.context});
}
