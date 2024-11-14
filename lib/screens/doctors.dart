import 'package:ayurhealth/screens/home.dart';
import 'package:flutter/material.dart';

class TopDoctors extends StatefulWidget {
  const TopDoctors({super.key});

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  List img = [
    "assets/doc/Rishi.png",
    "assets/doc/Image.png",
    "assets/doc/Nallarasi.png",
    "assets/doc/Nihal.png",
    "assets/doc/Rishita.png",
  ];
  List name = [
    "Dr. Rishi",
    "Dr. Vaamana",
    "Dr. Nallarasi",
    "Dr. Nihal",
    "Dr. Rishita",
  ];
  List Spcl = [
    "Cardiologist",
    "Dentists",
    "Orthopedics",
    "Cardiologist",
    "Dentists"
  ];
  List rate = ["4.7", "4.7", "4.7", "4.7", "4.7"];
  List loc = ["800m away", "800m away", "800m away", "800m away", "800m away"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          "Top Doctors",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "popins",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black26)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(img[index]),
                            width: 96,
                            height: 96,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: "popins"),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                Spcl[index],
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 12,
                                    fontFamily: "popins"),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: 41,
                                height: 18,
                                decoration:
                                    BoxDecoration(color: Color(0xFFDEE8F8)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      rate[index],
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 10,
                                          fontFamily: "popins"),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    loc[index],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontFamily: "popins"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
