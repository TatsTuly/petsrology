import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            end: Alignment.bottomRight,
             colors: [const Color.fromARGB(255, 255, 163, 246),
             const Color.fromARGB(255, 91, 213, 247)])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
              text: "Welcome\n",style: TextStyle(fontFamily: "DMSans",fontSize: 50,fontWeight: FontWeight.bold,
              color: Colors.white),
              children: [
                TextSpan(text: "to  "),
                TextSpan(
                  text: "Petsrology",style: TextStyle(color: const Color.fromARGB(255, 51, 2, 110),fontFamily: "DMSans")
                )
              ])),
              
          ],
        ),
      )
    );
  }
}