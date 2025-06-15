import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/app_bloc_providers.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/firebase_options.dart';
import 'package:plant_store/presentation/auth/screens/login_screen.dart';
import 'package:plant_store/presentation/main/main_screen.dart';

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
      providers: AppBlocProviders.blocProvidersList,
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          theme: Theme.of(context).copyWith(
            appBarTheme: AppBarTheme(iconTheme: IconThemeData(size: 24.w)),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            scaffoldBackgroundColor: ConstColors().ffffffff,
          ),
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRouter.navigatorKey,
          home: auth.currentUser == null ||
                  auth.currentUser != null && !auth.currentUser!.emailVerified
              ? LoginScreen()
              : MainScreen(),
        ),
      ),
    );
  }
}
