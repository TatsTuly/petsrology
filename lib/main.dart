import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petsrology/nav_menu/about_us.dart';
import 'package:petsrology/nav_menu/faq.dart';
import 'package:petsrology/nav_menu/logout.dart';
import 'package:petsrology/nav_menu/profile.dart';
import 'package:petsrology/nav_menu/settings.dart';
import 'package:provider/provider.dart';
import 'package:petsrology/adoption_screens/adoption_form.dart';
import 'package:petsrology/adoption_screens/home_screen.dart';
import 'package:petsrology/adoption_screens/submission.dart';
import 'package:petsrology/firebase_options.dart';
import 'package:petsrology/product/product_model/cart_model.dart';
import 'package:petsrology/product/product_screen.dart';
import 'package:petsrology/screen/home.dart';
import 'package:petsrology/screen/loginscreen.dart';
import 'package:petsrology/screen/onboarding.dart';
import 'package:petsrology/screen/signup.dart';
import 'package:petsrology/screen/splashscreen.dart';
import 'package:petsrology/screen/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Petsrology',
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
          '/profile': (context) => const ProfilePage(),
          '/settings': (context) => const SettingsPage(),
          '/faq': (context) => const FAQPage(),
          '/about': (context) => const AboutUsPage(),
          '/logout': (context) => const LogoutPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
