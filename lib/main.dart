import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/widgets/custom_loading_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/firebase_options.dart';
import 'package:plant_store/presentation/auth/bloc/login/login_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/sign_up/sign_up_bloc.dart';
import 'package:plant_store/presentation/auth/bloc/verify_email/verify_email_bloc.dart';
import 'package:plant_store/presentation/auth/screens/login_screen.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc.dart';
import 'package:plant_store/presentation/home/blocs/equipments_bloc/equipments_bloc.dart';
import 'package:plant_store/presentation/home/blocs/plants_bloc/plants_bloc.dart';
import 'package:plant_store/presentation/main/main_screen.dart';
import 'package:plant_store/presentation/profile/bloc/profile_screen_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => VerifyEmailBloc()),
        BlocProvider(create: (context) => ProfileScreenBloc()),
        BlocProvider(create: (context) => PlantsBloc()),
        BlocProvider(create: (context) => EquipmentsBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRouter.navigatorKey,
          theme: Theme.of(context).copyWith(
            appBarTheme: AppBarTheme(iconTheme: IconThemeData(size: 24.w)),
            splashColor: Colors.transparent,
            // It remove the unecessary borders
            dividerColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            scaffoldBackgroundColor: ConstColors().ffffffff,
          ),
          // This is the initial route of the app checking if the user is logged in or not with FirebaseAuth
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomLoading();
              }
              final user = snapshot.data;
              if (user == null || !user.emailVerified) {
                return LoginScreen();
              } else {
                return MainScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
