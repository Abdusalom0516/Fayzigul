import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/features/auth/bloc/login/login_bloc.dart';
import 'package:plant_store/features/auth/bloc/sign_up/sign_up_bloc.dart';
import 'package:plant_store/features/auth/bloc/verify_email/verify_email_bloc.dart';

class AppBlocProviders {
  static List<BlocProvider> blocProvidersList = [
    BlocProvider(create: (context) => LoginBloc()),
    BlocProvider(create: (context) => SignUpBloc()),
    BlocProvider(create: (context) => VerifyEmailBloc()),
  ];
}
