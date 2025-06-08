import 'package:equatable/equatable.dart';

class FirebaseAuthErrorCodes extends Equatable {
  static FirebaseLoginErrorCodes loginErrorCodes = FirebaseLoginErrorCodes();
  static FirebaseSignUpErrorCodes signUpErrorCodes = FirebaseSignUpErrorCodes();

  

  @override
  List<Object?> get props => [];
}


class FirebaseLoginErrorCodes extends FirebaseAuthErrorCodes {
  final String invalidEmail = "invalid-email";
  final String userDisabled = "user-disabled";
  final String userNotFound = "user-not-found";
  final String wrongPassword = "wrong-password";
  final String tooManyRequests = "too-many-requests";
}

class FirebaseSignUpErrorCodes {
  final String emailAlreadyInUse = "email-already-in-use";
  final String invalidEmail = "invalid-email";
  final String operationNotAllowed = "operation-not-allowed";
  final String weakPassword = "weak-password";
}
