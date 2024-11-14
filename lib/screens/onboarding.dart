import 'package:ayurhealth/screens/home.dart';
import 'package:ayurhealth/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:ayurhealth/screens/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/Vector.png"),
                width: 118,
                height: 105,
              ),
              Text(
                "Health Care",
                style: TextStyle(
                    color: Color(0xFF223A6A),
                    fontWeight: FontWeight.bold,
                    fontFamily: "popins",
                    fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Let's get started !",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "popins",
                    fontSize: 30),
              ),
              Text(
                "Login to Stay healthy and fit",
                style: TextStyle(
                    color: Color(0xFFBBBBBB),
                    fontFamily: "popins",
                    fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login_Page(),
                        ));
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(260, 70)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    overlayColor: WidgetStatePropertyAll(Color(0xFF448AFF)),
                    side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.blueAccent, width: 1)),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "popins"),
                  )),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ));
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(260, 70)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    overlayColor: WidgetStatePropertyAll(Color(0xFF448AFF)),
                    side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.blueAccent, width: 1)),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "popins"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
