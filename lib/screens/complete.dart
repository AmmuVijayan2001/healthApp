import 'package:ayurhealth/screens/home.dart';
import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children:[ Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 40,
                  color: Colors.green,
                ),
                Text(
                  "Order Placed Successfully !",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "popins",
                      fontSize: 20),
                ),SizedBox(height: 50,),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(name: "name"),));
                },
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        " Back to Home",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "popins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ])
    );
  }
}
