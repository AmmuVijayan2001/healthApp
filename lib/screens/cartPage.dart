import 'package:ayurhealth/provider/cartProvider.dart';
import 'package:ayurhealth/screens/checkOut.dart';
import 'package:ayurhealth/screens/pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> counts = [];
  List image = [
    "assets/imge1.jpeg",
    "assets/imge2.jpeg",
    "assets/imge3.jpeg",
    "assets/imge4.jpeg",
    "assets/imge5.jpeg",
  ];

  @override
  void initState() {
    super.initState();
    final p = Provider.of<Providerr>(context, listen: false);
    counts = List.filled(p.rate1.length, 1); // Initialize item counts
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Providerr>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "popins",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: p.name.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Cart is empty",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 40,
                      fontFamily: "popins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PharmacyPage(),
                          ));
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                      size: 50,
                    )),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    height: 250,
                    width: 350,
                    child: PageView.builder(
                      itemCount: image.length,
                      pageSnapping: true,
                      // Enables snapping to pages
                      controller: PageController(viewportFraction: 0.8),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              image[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: p.name.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _buildCartItem(p, index);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildPaymentDetails(p),
                  SizedBox(height: 10),
                  _buildCheckoutButton(p),
                ],
              ),
            ),
    );
  }

  Widget _buildCartItem(Providerr p, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black26),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(p.img1[index], width: 96, height: 96),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCartItemHeader(p, index),
                    SizedBox(height: 5),
                    Text(
                      p.pname[index],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: "popins",
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildCartItemControls(p, index),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItemHeader(Providerr p, int index) {
    return Row(
      children: [
        Text(
          p.name[index],
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: "popins",
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              p.toggleFavorite(
                p.img1[index],
                p.rate1[index],
                p.name[index],
                p.pname[index],
              );
            });
          },
          child: Icon(
            Icons.delete_outline,
            color: Colors.black45,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildCartItemControls(Providerr p, int index) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (counts[index] > 1) {
                counts[index]--;
              } else {
                p.toggleFavorite(
                  p.img1[index],
                  p.rate1[index],
                  p.name[index],
                  p.pname[index],
                );
              }
            });
          },
          child: Icon(Icons.remove, color: Colors.black, size: 15),
        ),
        SizedBox(width: 10),
        Text(
          "${counts[index]}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: "popins",
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              counts[index]++;
            });
          },
          child: Icon(Icons.add, color: Colors.black, size: 15),
        ),
        Spacer(),
        Text(
          "\$${(p.rate1[index] * counts[index]).toStringAsFixed(2)}",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 15,
            fontFamily: "popins",
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentDetails(Providerr p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Detail",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "popins",
          ),
        ),
        SizedBox(height: 10),
        _buildPaymentRow("Subtotal", _calculateSubtotal(p)),
        SizedBox(height: 10),
        _buildPaymentRow("Taxes", _calculateTaxes(p)),
        SizedBox(height: 10),
        _buildPaymentRow("Total", _calculateTotal(p), isBold: true),
      ],
    );
  }

  Widget _buildPaymentRow(String label, double amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isBold ? Colors.black : Colors.grey,
            fontSize: 15,
            fontFamily: "popins",
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          "\$${amount.toStringAsFixed(2)}",
          style: TextStyle(
            color: isBold ? Colors.black : Colors.grey,
            fontSize: 15,
            fontFamily: "popins",
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton(Providerr p) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Total",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: "popins",
              ),
            ),
            Text(
              "\$${_calculateTotal(p).toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "popins",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CheckOut()));
          },
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: Colors.blue,
          ),
          child: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "popins",
            ),
          ),
        ),
      ],
    );
  }

  double _calculateSubtotal(Providerr p) {
    double subtotal = 0;
    for (int i = 0; i < counts.length; i++) {
      subtotal += p.rate1[i] * counts[i];
    }
    return subtotal;
  }

  double _calculateTaxes(Providerr p) {
    return _calculateSubtotal(p) * 0.08; // Example tax rate: 8%
  }

  double _calculateTotal(Providerr p) {
    return _calculateSubtotal(p) + _calculateTaxes(p);
  }
}
