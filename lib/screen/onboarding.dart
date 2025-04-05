import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  int totalPage = 3;
  @override
   Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      padding: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 400,
                        child:  Image.asset(
                        "assets/images/start2.png",
                        fit: BoxFit.cover,)
                        )
                      Text("Welcome to Petsrology",
                      style: TextStyle(
                        fontSize: 28,fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                      Text("All type of services for your pet care in one place",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),)  
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}
