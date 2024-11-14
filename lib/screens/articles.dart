import 'package:flutter/material.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List img = [
    'assets/homeImg/Rectangle 460.png',
    'assets/homeImg/Rectangle 954.png',
    'assets/homeImg/Rectangle 460.png',
    'assets/homeImg/Rectangle 954.png',
    'assets/homeImg/Rectangle 954.png',
    'assets/homeImg/Rectangle 460.png',
    'assets/homeImg/Rectangle 954.png',
    'assets/homeImg/Rectangle 460.png',
    'assets/homeImg/Rectangle 954.png',
    'assets/homeImg/Rectangle 954.png',
  ];
  List hl = [
    'The 25 Healthier Fruits You Can Eat ,According to a Nutritionist',
    'The Impact of COVID-19 on Health Care Systems',
    'Monsoon Eye Care: Protect Yourself From Rainy Season Infections With Doctor`s Advice',
    'COVID Study: Virus Inflammation in Pregnancy Unveiled',
    'COVID Study: Virus Inflammation in Pregnancy Unveiled',
    'The 25 Healthier Fruits You Can Eat ,According to a Nutritionist',
    'The Impact of COVID-19 on Health Care Systems',
    'Monsoon Eye Care: Protect Yourself From Rainy Season Infections With Doctor`s Advice',
    'COVID Study: Virus Inflammation in Pregnancy Unveiled',
    'COVID Study: Virus Inflammation in Pregnancy Unveiled',
  ];
  List sub = [
    'Jun 19,2024   5min read',
    'Jul 24,2024   1hr  read',
    'Sep 10,2024   2min read',
    'Sep 29,2024   5min read',
    'Sep 29,2024   5min read',
    'Jun 19,2024   5min read',
    'Jul 24,2024   1hr  read',
    'Sep 10,2024   2min read',
    'Sep 29,2024   5min read',
    'Sep 29,2024   5min read',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Articles",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "popins"),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                //  physics: NeverScrollableScrollPhysics(),
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 100,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(img[index]),
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
                                Text(hl[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "popins",
                                        fontWeight: FontWeight.normal)),
                                Text(
                                  sub[index],
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontFamily: "popins"),
                                ),
                              ],
                            )),
                            Image(
                              image: AssetImage("assets/homeImg/Bookmark2.png"),
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
