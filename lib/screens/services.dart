import 'package:ayurhealth/screens/doctors.dart';
import 'package:ayurhealth/screens/pharmacy.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List gImg = [
    "assets/homeImg/stethoscope.png",
    "assets/homeImg/pill.png",
    "assets/homeImg/ambulance.png",
    "assets/homeImg/video-camera.png",
    "assets/homeImg/Report.png",
    "assets/homeImg/Emergency.png",
    "assets/homeImg/Tests.png",
    "assets/homeImg/doctor-consultation.png",
    "assets/services/chat.png",
    "assets/services/community.png",
    "assets/services/diet.png",
    "assets/services/gqdgets.png",
    "assets/services/insurance.png",
    "assets/services/Telephone.png"
  ];

  List Descrptn = [
    "Top Doctors",
    "Pharmacy",
    "Ambulance",
    "Video Call",
    "Reports",
    "Emergency",
    "Lab",
    "Consultation",
    "Chat",
    "Community",
    "Diet and Nutrition",
    "Medical Gadgets",
    "Insutance",
    "Telephone"
  ];

  List<Widget> page = [
    TopDoctors(),
    PharmacyPage(),
    TopDoctors(),
    PharmacyPage(),
    TopDoctors(),
    PharmacyPage(),
    TopDoctors(),
    PharmacyPage(),
    TopDoctors(),
    PharmacyPage(),
    TopDoctors(),
    PharmacyPage(),
    TopDoctors(),
    PharmacyPage(),
  ];
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
          "Our Services",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "popins"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0),
                itemCount: gImg.length,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => page[index],
                              ));
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: Image(
                            image: AssetImage(gImg[index]),
                            width: 30,
                            height: 30,
                          ),
                          //  backgroundImage: AssetImage(gImg[index]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          Descrptn[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "popins",
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
