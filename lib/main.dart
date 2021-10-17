import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/models/loginauthentication.dart';
import 'package:gym_app/models/trainerauthentication.dart';
import 'package:gym_app/screens/auth/login_screen.dart';
import 'package:gym_app/screens/auth/signup_screen.dart';
import 'package:gym_app/screens/auth/splash_page.dart';
import 'package:provider/provider.dart';
import 'models/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        ),
        ChangeNotifierProvider(
          create: (context) => Trainerauthentication(),
        ),
        ChangeNotifierProvider(
          create: (context) => Loginauthentication(),
        )
      ],
      child: MaterialApp(
        title: 'gym',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.red,
        ),
        home: SplashScreen(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
        },
      ),
    );
  }
}
