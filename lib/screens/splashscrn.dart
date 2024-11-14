import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ayurhealth/screens/page1.dart';
import 'package:ayurhealth/screens/login.dart';

class Splsh_Scrn extends StatefulWidget {
  const Splsh_Scrn({super.key});

  @override
  State<Splsh_Scrn> createState() => _Splsh_ScrnState();
}

class _Splsh_ScrnState extends State<Splsh_Scrn> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Page1()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3EAF5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage("assets/pill2.png"),
                    width: 39,
                    height: 49,
                  ),
                  Image(
                    image: AssetImage("assets/pill.png"),
                    width: 76,
                    height: 111,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Align(alignment: Alignment.bottomLeft,
                    child: Image(
                      image: AssetImage("assets/stheth.png"),
                      width: 190,
                      height: 374,
                    ),
                  ),
                  Align(alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage("assets/bandage.png"),
                      width: 190,
                      height: 374,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
