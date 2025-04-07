import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: double.infinity,
              height: constraints.maxHeight,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 249, 251)),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
              
                  const Text(
                    "Welcome to Petsrology",
                    style: TextStyle(
                      fontFamily: "Playfair",
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 164, 2, 118),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // SIGN IN Button
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/loginscreen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 178, 57, 149),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Playfair",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF5F5F6),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // SIGN UP Button
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 0, 10, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Playfair",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF5F5F6),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    "Login with Social Media",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(
                    "assets/logo/medialogo.png"
                  
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
