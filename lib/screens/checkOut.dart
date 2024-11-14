import 'package:ayurhealth/provider/addProvider.dart';
import 'package:ayurhealth/provider/addressprovider.dart';
import 'package:ayurhealth/provider/cartProvider.dart';
import 'package:ayurhealth/screens/addAddress.dart';
import 'package:ayurhealth/screens/addCard.dart';
import 'package:ayurhealth/screens/complete.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List<int> counts = [];

  @override
  void initState() {
    super.initState();
    final p = Provider.of<Providerr>(context, listen: false);
    counts = List.filled(p.rate1.length, 1); // Initialize item counts
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Providerr>(context);
    final c = Provider.of<AddProvider>(context);
    final a = Provider.of<AddressProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "popins",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "popins",
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addaddress(),
                        ));
                  },
                  child: Text(
                    "Add Address",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontFamily: "popins",
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: a.Pincode.isEmpty
                  ? Image(
                      image: AssetImage("assets/361.jpg"),
                      width: double.maxFinite,
                      height: 400,
                      fit: BoxFit.contain,
                    )
                  : ListView.builder(
                      itemCount: a.Pincode.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: double.maxFinite,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.black45, width: 1)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.my_location,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Text(
                                    "${a.Addressline1[index] + "," + a.Street[index] + "," + a.Pincode[index] + "," + a.district[index]}",
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontFamily: "popins",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "popins",
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCard(),
                        ));
                  },
                  child: Text(
                    "Add Card",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontFamily: "popins",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            c.Cname.isEmpty
                ? Image(
                    image: AssetImage(
                        "assets/03 - Credit card - Account Card.png"),
                    width: double.maxFinite,
                    height: 300,
                    fit: BoxFit.contain,
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: c.Cname.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: double.maxFinite,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.black45, width: 1)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.credit_card,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '**** **** ${c.Cnum[index].substring(c.Cnum[index].length - 4)}',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontFamily: "popins",
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(height: 10),
            _buildPaymentDetails(p),
            SizedBox(height: 10),
          ],
        ),
      ),
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
            fontSize: 15,
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
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Complete(),
                ));
          },
          child: Container(
            width: double.maxFinite,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Place Order",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "popins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
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

// import 'package:ayurhealth/screens/addCard.dart';
// import 'package:flutter/material.dart';
//
// class Paymentmethods extends StatefulWidget {
//   const Paymentmethods({super.key});
//
//   @override
//   State<Paymentmethods> createState() => _PaymentmethodsState();
// }
//
// class _PaymentmethodsState extends State<Paymentmethods> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               Container(
//                 height: 60,
//                 width: double.maxFinite,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.blue, width: 0.5)),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15, right: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image(
//                         image: AssetImage("assets/VISA.png"),
//                         width: 40,
//                         height: 40,
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         size: 20,
//                         color: Colors.grey,
//                       )
//                     ],
//                   ),
//                 ),
//               ),SizedBox(height: 15,),
//               GestureDetector(onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => AddCard(),));
//               },
//                 child: Container(
//                   height: 50,
//                   width: double.maxFinite,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.add_circle_outline,
//                         size: 25,
//                         color: Colors.white,
//                       ),SizedBox(width: 10,),
//                       Text("Add Card",style: TextStyle(fontSize: 15,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: "popins"),)
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
