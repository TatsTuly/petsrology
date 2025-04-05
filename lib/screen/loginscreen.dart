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
        body:Stack( 
          children:[
        Container(
          height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                  const Color.fromARGB(255, 248, 78, 177),
                  const Color.fromARGB(255, 30, 199, 229)
                ])),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 22),
              child: Text(
                "Hello PetLover\nSign In!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              ),
              color: const Color.fromARGB(255, 203, 195, 195)
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.check,color: Colors.blueGrey,),
                      label: Text("Username/E-mail",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 96, 1, 179)
                      ),)
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off,color: Colors.blueGrey,),
                      label: Text("Password",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 96, 1, 179)
                      ),)
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Forgot Password?",style: TextStyle(
                      fontSize: 12,
                      fontFamily: "DMSans",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,

                    ),),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                     SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 188, 10, 146),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      child: const Text(
                        "Log IN",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF5F5F6),
                        ),
                      ),
                    ),
                  ),
                ],
              ), 
            ),
          ),
        )
           
            ],
            )
            );
  }
}
