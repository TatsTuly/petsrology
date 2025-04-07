import 'package:flutter/material.dart';
import 'package:petsrology/adoption_screens/adoption_form.dart';
import 'package:petsrology/adoption_screens/home_screen.dart';
import 'package:petsrology/adoption_screens/submission.dart';
import 'package:petsrology/product/product_screen.dart';
import 'package:petsrology/screen/home.dart';
import 'package:petsrology/screen/loginscreen.dart';
import 'package:petsrology/screen/onboarding.dart';
import 'package:petsrology/screen/signup.dart';
import 'package:petsrology/screen/splashscreen.dart';
import 'package:petsrology/screen/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Playfair',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/loginscreen': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignUp(),
        '/home_screen': (context) => PetsHomeScreen(),
        '/home': (context) => HomePage(),
        '/adoption_form': (context) => AdoptionForm(),
        '/submission': (context) => SubmissionForm(),
        '/product_screen': (context) => ProductsHomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
