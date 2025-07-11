abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {}

class SignUpFailure extends SignUpStates {
  String message;

  SignUpFailure({required this.message});
}
