import 'package:ayurhealth/screens/home.dart';
import 'package:ayurhealth/screens/signup.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController _namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [SizedBox(height: 15,),
              Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "popins"),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _namecontroller,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("assets/User-Outline.png"),
                        width: 7,
                        height: 7,
                      ),
                    ),
                    hintText: "Enter your name",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontFamily: "popins", fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: double.maxFinite,
                        ))),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontFamily: "popins", fontSize: 15),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("assets/Password.png"),
                        width: 7,
                        height: 7,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: double.maxFinite,
                        ))),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontFamily: "popins",
                        fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  String name = _namecontroller.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(name: name)));
                },
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "popins"),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "popins"),
                  ),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                  },
                    child: Text(
                      "Sign up ",
                      style: TextStyle(
                          color: Colors.blue, fontSize: 15, fontFamily: "popins"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "OR",
                style: TextStyle(
                    color: Colors.black12, fontSize: 15, fontFamily: "popins"),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                width: double.maxFinite,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/Google.png"),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign in with Google  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "popins"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.maxFinite,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/Facebook.png"),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign in with Facebook  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "popins"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
