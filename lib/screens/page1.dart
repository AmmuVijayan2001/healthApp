import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ayurhealth/screens/onboarding.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List img = ["assets/man.png", "assets/lady.png"];
  List text = [
    "Find a lot specialist doctors in one place",
    "Get advice from a doctor you believe in"
  ];
  int _currentIndex = 0; // Track the current index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Text(
            "skip",
            style: TextStyle(
              color: Colors.black26,
              fontSize: 15,
            ),
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CarouselSlider(
                items: img.asMap().entries.map((entry) {
                  int index = entry.key; // Get the index
                  String item = entry.value; // Get the image path

                  return Container(
                    child: Column(
                      children: [
                        Expanded(
                          // To ensure the image uses available space without overflow
                          child: Image.asset(
                            item,
                            fit: BoxFit
                                .contain, // Fit the image nicely within its container
                            width: 900,
                            height: 500, // You can adjust this height
                          ),
                        ),
                        SizedBox(
                            height: 10), // Add space between image and text
                        Text(
                          text[index], // Display the corresponding text
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "popins"),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 500,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,onPageChanged:(index, reason) {
                    setState(() {
                      _currentIndex = index; // Update the current index
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Hyphen indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.start
                ,
                children: img.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Container(
                    width: 20,
                    height: 5,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.blue
                          : Colors.grey, // Highlight the active indicator
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Onboarding(),
                          ));
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      ),
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
