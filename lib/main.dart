import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/layout/home_screen/provider/home_provider.dart';
import 'package:todoapp/shared/provider/auth_provider.dart';
import 'package:todoapp/style/theme.dart';

import 'firebase_options.dart';
import 'layout/home_screen/home_screen.dart';
import 'layout/login/login_screen.dart';
import 'layout/register/register_screen.dart';
import 'layout/splash_screen/splash_screen.dart';

 void  main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        //btdek list mn al provider msh provider wahed
        ChangeNotifierProvider(create:  (context) => Authprovider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.routeName:(context) => LoginScreen(),
        RegisterScreen.routeName:(context) => RegisterScreen(),
        HomeScreen.routeName:(context) => ChangeNotifierProvider(
            create:(context) => HomeProvider(),
            child: HomeScreen()),
        SplashScreen.routeName:(context) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:ThemeMode.light,
      

    );
  }
}
