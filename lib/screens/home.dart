import 'package:ayurhealth/provider/cartProvider.dart';
import 'package:ayurhealth/screens/cartPage.dart';
import 'package:ayurhealth/screens/fav.dart';
import 'package:ayurhealth/screens/pharmacy.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ayurhealth/screens/services.dart';
import 'package:ayurhealth/screens/doctors.dart';
import 'package:ayurhealth/screens/profile.dart';
import 'package:ayurhealth/screens/articles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  final String name;

  HomePage({required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget service(String icon, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Image(
            image: AssetImage(icon),
            width: 30,
            height: 30,
          ),
          //  backgroundImage: AssetImage(gImg[index]),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontFamily: "popins",
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Providerr>(context);

    return Scaffold(
      backgroundColor: Color(0xFFD4EBEE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage: AssetImage(
                                "assets/homeImg/Ellipse 78.png",
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "welcome !",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "popins",
                              fontSize: 17),
                        ),
                        Text(widget.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "popins",
                                fontSize: 17)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("How is it going today ?",
                            style: TextStyle(
                                color: Colors.black26,
                                fontFamily: "popins",
                                fontSize: 12)),
                      ],
                    ),
                  ),SizedBox(width: 10,),
                  Align(alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage("assets/homeImg/women.png"),
                      height: 200,
                      width: 120,
                    ),
                  ),SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Stack(children: [
                      GestureDetector(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
                      },
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.black,
                          size: 25,
                        ),
                      ), Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.red,
                          child: Text(
                            "${p.fav1Length}", // Replace '5' with your count variable
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Stack(children: [
                      GestureDetector(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FavPage(),));
                      },
                        child: Image(image: AssetImage("assets/heart.png"),width: 20,height: 25,)
                      ),
                    ]),
                  ),
                ],
              ),
              Container(
                width: double.maxFinite,
                height: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 40,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Search, doctor , drugs , articles....",
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15,
                                fontFamily: "popins",
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.black12)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TopDoctors(),
                                  ));
                            },
                            child: service("assets/homeImg/stethoscope.png",
                                "Top Doctors"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PharmacyPage(),
                                  ));
                            },
                            child: Container(
                                child: service(
                                    "assets/homeImg/pill.png", "Pharmacy")),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ServiceScreen(),
                                    ));
                              },
                              child:
                                  service("assets/homeImg/more.png", "SeeAll"))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                        items: [
                          Container(
                            width: double.maxFinite,
                            height: 200,
                            child: Image(
                              image: AssetImage("assets/homeImg/Ad_2.jpg"),
                              width: 500,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 100,
                            child: Image(
                              image: AssetImage("assets/homeImg/Ad_3.jpg"),
                              width: 500,
                              height: 200,
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 100,
                            child: Image(
                              image: AssetImage("assets/homeImg/Ad_4.jpg"),
                              width: 500,
                              height: 200,
                            ),
                          )
                        ],
                        options: CarouselOptions(
                            height: 200,
                            viewportFraction: 1.0,
                            autoPlay: true,
                            enlargeCenterPage: true)),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Text(
                            "Health articles",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "popins"),
                          ),
                        ),GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticlesScreen(),
                                ));
                          },
                          child: Text("See all",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontFamily: "popins")),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 100,
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/homeImg/Rectangle 460.png"),
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "The 25 Healthier Fruits You Can Eat ,According to a Nutritionist",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "popins",
                                          fontWeight: FontWeight.normal)),
                                  Text(
                                    "Jun 19,2024   5min read",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontFamily: "popins"),
                                  ),
                                ],
                              )),
                              Image(
                                image:
                                    AssetImage("assets/homeImg/Bookmark2.png"),
                                width: 15,
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 100,
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/homeImg/Rectangle 460.png"),
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "The 25 Healthier Fruits You Can Eat ,According to a Nutritionist",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "popins",
                                          fontWeight: FontWeight.normal)),
                                  Text(
                                    "Jun 19,2024   5min read",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontFamily: "popins"),
                                  ),
                                ],
                              )),
                              Image(
                                image:
                                    AssetImage("assets/homeImg/Bookmark2.png"),
                                width: 15,
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12)),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Deals You Can't Miss",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "popins",
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/homeImg/offer_1.jpg"))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/homeImg/offer_2.jpg"))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/homeImg/offer_3.jpg"))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/homeImg/offer_4.jpg"))),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
              //
              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 500,
              //     autoPlay: true,
              //     enlargeCenterPage: true,
              //     aspectRatio: 16 / 9,
              //     viewportFraction: 0.8,
              //     initialPage: 0,
              //   ),
              //   items: img.map((item) => Container(
              //     child: Center(
              //       child: Image.network(item, fit: BoxFit.cover, width: 1000),
              //     ),
              //   )).toList(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
