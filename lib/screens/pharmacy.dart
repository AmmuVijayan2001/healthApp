import 'package:ayurhealth/provider/cartProvider.dart';
import 'package:ayurhealth/provider/favProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({super.key});

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

var count;

class _PharmacyPageState extends State<PharmacyPage> {
  List<String> img1 = [
    "assets/pharmacy/Image.png",
    "assets/pharmacy/Image (1).png",
    "assets/pharmacy/Image (2).png",
    "assets/pharmacy/Image (3).png",
    "assets/pharmacy/Image (1).png",
    "assets/pharmacy/Image (2).png",
    "assets/pharmacy/Image.png",
    "assets/pharmacy/Image (1).png",
    "assets/pharmacy/Image (2).png",
    "assets/pharmacy/Image (3).png",
    "assets/pharmacy/Image (1).png",
    "assets/pharmacy/Image (2).png",
  ];

  List<String> name = [
    "Panadol",
    "Bodrex Herbal",
    "Konidin",
    "OBH Combi",
    "Bodrexin",
    "Kodin",
    "Panadolin",
    "Bodrex Herb",
    "Kondin",
    "OBH Combo",
    "Bodrex",
    "Konidn"
  ];

  List<String> pname = [
    "20pcs",
    "100ml",
    "3pcs",
    "75ml",
    "50ml",
    "3pcs",
    "20pcs",
    "100ml",
    "3pcs",
    "75ml",
    "50ml",
    "3pcs"
  ];
  List<int> rate1 = [12, 30, 24, 75, 90, 80, 50, 40, 20, 100, 95, 35];
  late List<bool> isFavorite;
  late List<bool> isAdded;

  @override
  void initState() {
    super.initState();
    // Initialize isFavorite in initState
    isFavorite = List.filled(img1.length, false);
    isAdded = List.filled(img1.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final f = Provider.of<ProviderFav>(context);

    final p = Provider.of<Providerr>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Container(
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
                        "Search , drugs , category....",
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
                      border: Border.all(color: Colors.blue)),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.maxFinite,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEF3FB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Order quickly with ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "popins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              " prescription",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "popins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blueAccent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Upload Prescription",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: "popins"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/pharmacy/Mask group.png"),
                        height: 180,
                        width: 190,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product on Sale",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "popins",
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Expanded(
                //   child: GridView.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       mainAxisSpacing: 4,
                //       crossAxisSpacing: 4,
                //       childAspectRatio: 0.8, // Adjust aspect ratio to fit content
                //     ),
                //     itemCount: img1.length,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         height: 150, // Set fixed height
                //         width: 100,  // Set fixed width
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15),
                //           border: Border.all(color: Colors.black54, width: 1.2),
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.all(8),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Image(
                //                 image: AssetImage(img1[index]),
                //                 width: 60, // Adjusted width for inner image
                //                 height: 60, // Adjusted height for inner image
                //               ),
                //               SizedBox(height: 5), // Add spacing
                //               Text(
                //                 name[index],
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontSize: 13,
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: "popins",
                //                 ),
                //               ),
                //               Text(
                //                 pname[index],
                //                 style: TextStyle(
                //                   color: Colors.grey,
                //                   fontSize: 9,
                //                   fontFamily: "popins",
                //                 ),
                //               ),
                //               SizedBox(height: 5), // Add spacing
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     rate1[index],
                //                     style: TextStyle(
                //                       color: Colors.black,
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: "popins",
                //                     ),
                //                   ),
                //                   ElevatedButton(
                //                     onPressed: () {
                //                       p.toggleFavorite(
                //                         img1[index],
                //                         rate1[index],
                //                         name[index],
                //                         pname[index],
                //                       );
                //                     },
                //                     style: ElevatedButton.styleFrom(
                //                       minimumSize: Size(20, 20),
                //                       backgroundColor: Colors.blue,
                //                       shape: BeveledRectangleBorder(
                //                         borderRadius: BorderRadius.circular(6),
                //                       ),
                //                     ),
                //                     child: Text(
                //                       "+",
                //                       style: TextStyle(
                //                         color: Colors.white,
                //                         fontSize: 15,
                //                         fontWeight: FontWeight.bold,
                //                         fontFamily: "popins",
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               GestureDetector(
                //                 onTap: () {
                //                   // f.toggleFav(img1[index], rate1[index], name[index], pname[index]);
                //                 },
                //                 child: Padding(
                //                   padding: const EdgeInsets.only(top: 5),
                //                   child: Image(
                //                     image: AssetImage("assets/planeheart.png"),
                //                     width: 20,
                //                     height: 20,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // )
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Check the width of the screen
                      int crossAxisCount = constraints.maxWidth < 579 ? 2 : 3;

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          childAspectRatio:
                              0.8, // Adjust aspect ratio to fit content
                        ),
                        itemCount: img1.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 150, // Set fixed height
                            width: 100, // Set fixed width
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black54, width: 1.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(img1[index]),
                                    width: 60, // Adjusted width for inner image
                                    height:
                                        60, // Adjusted height for inner image
                                  ),
                                  SizedBox(height: 5), // Add spacing
                                  Text(
                                    name[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "popins",
                                    ),
                                  ),
                                  Text(
                                    pname[index],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 9,
                                      fontFamily: "popins",
                                    ),
                                  ),
                                  SizedBox(height: 5), // Add spacing
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                       "\$ ${rate1[index]}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "popins",
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Directly call the provider's method without using setState.
                                          p.toggleFavorite(
                                            img1[index],
                                            rate1[index],
                                            name[index],
                                            pname[index],
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(40, 40), // Adjusted minimum size for better usability
                                          backgroundColor: Colors.blue,
                                          shape: BeveledRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                        ),
                                        child: Consumer<Providerr>(
                                          builder: (context, providerr, child) {
                                            final isCart = providerr.isCart(name[index]); // Check if the item is in the cart
                                            return Text(
                                              isCart ? "Added" : "+", // Change button label based on cart status
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "popins",
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                    ],
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      f.toggleFav(img1[index], rate1[index],
                                          name[index], pname[index]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Consumer<ProviderFav>(
                                        builder: (context, providerFav, child) {
                                          final isFavorite = providerFav
                                              .isFavorited(name[index]);
                                          return Icon(
                                            isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: isFavorite
                                                ? Colors.red
                                                : Colors.grey,
                                            size: 20,
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  // Icon(Icons.outlined),
                                  //
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       isFavorite[index]=!isFavorite[index];
                                  //       f.toggleFav(img1[index], rate1[index], name[index], pname[index]);
                                  //
                                  //     });
                                  //   },
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(top: 5),
                                  //     child: Image(
                                  //       image: AssetImage(isFavorite[index]? "assets/heart.png":"assets/planeheart.png"),
                                  //       width: 20,
                                  //       height: 20,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
