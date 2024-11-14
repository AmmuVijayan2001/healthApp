import 'package:ayurhealth/screens/login.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              Text(
                "Sign Up",
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
                //controller: _namecontroller,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("assets/name.png"),
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
                //controller: _namecontroller,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("assets/User-Outline.png"),
                        width: 7,
                        height: 7,
                      ),
                    ),
                    hintText: "Enter your email",
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
                height: 10,
              ),
              Row(
                children: [
                  // Container(
                  //   width: 25,
                  //   height: 20,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(5),
                  //       border: Border.all(color: Colors.black26, width: 1)),
                  // ),
                  GestureDetector(onTap: (){
                    setState(() {
                      isChecked=! isChecked;

                    });
                  },
                      child: Icon(isChecked ?Icons.check_box :
                    Icons.check_box_outline_blank,
                    size: 30,
                    color: Colors.black45,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                          "I agree to the healthcare Terms of services and privacy Policy")),
                ],
              ),
              SizedBox(
                height: 220,
              ),
              GestureDetector(
                onTap: () {
                  if(isChecked==true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login_Page()));
                  }
                },
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  child: Center(
                    child: Text(
                      "Sign Up",
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
                    "Already have an account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "popins"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login_Page(),
                          ));
                    },
                    child: Text(
                      "Sign in ",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontFamily: "popins"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
