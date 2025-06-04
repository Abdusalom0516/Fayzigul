import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(builder: (context, state) => ,);
  }
}