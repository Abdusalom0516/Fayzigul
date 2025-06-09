import 'package:flutter/material.dart';

abstract class LoginEvents {}

class OnLoginButtonClicked extends LoginEvents {
  String email, password;
  BuildContext context;

  OnLoginButtonClicked({
    required this.email,
    required this.password,
    required this.context,
  });
}
