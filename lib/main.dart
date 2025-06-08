import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/firebase_options.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/sign_up/sign_up_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/verify_email/verify_email_bloc.dart';
import 'package:plant_store/presentation/auth/screens/auth_screen.dart';
import 'package:plant_store/presentation/home/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => VerifyEmailBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRouter.navigatorKey,
          home: auth.currentUser == null ||
                  auth.currentUser != null && !auth.currentUser!.emailVerified
              ? AuthScreen()
              : HomeScreen(),
        ),
      ),
    );
  }
}
