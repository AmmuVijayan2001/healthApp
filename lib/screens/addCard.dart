import 'package:ayurhealth/provider/addProvider.dart';
import 'package:ayurhealth/screens/checkOut.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardnumController = TextEditingController();
  final TextEditingController _expdateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<AddProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add Card",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "popins"),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              // Validate only after user interaction
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                        "assets/03 - Credit card - Account Card.png"),
                    width: 500,
                    height: 250,
                  ),
                  TextFormField(
                    controller: _nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Name on Card",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: "popins",
                          fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.green), // Green border when focused
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          r'[a-zA-Z\s]')), // Allow only alphabetic characters and spaces
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name on Card is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _cardnumController,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(12),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: "popins",
                          fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.green), // Green border when focused
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Card Number is required';
                      } else if (value.length < 12) {
                        return "Card number must be 12 digits";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _expdateController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9/]')),
                          ],
                          decoration: InputDecoration(
                            hintText: "Expiry Date (MM/YY)",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "popins",
                              fontSize: 15,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors
                                      .green), // Green border when focused
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Expiry Date is required';
                            }

                            // Check if the format matches MM/YY
                            final dateRegex =
                                RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
                            if (!dateRegex.hasMatch(value)) {
                              return 'Invalid format. Use MM/YY';
                            }

                            // Check if the date is in the future
                            final now = DateTime.now();
                            final inputMonth = int.parse(value.substring(0, 2));
                            final inputYear =
                                int.parse('20${value.substring(3)}');
                            final inputDate = DateTime(inputYear, inputMonth);

                            if (inputDate
                                .isBefore(DateTime(now.year, now.month))) {
                              return 'Card is expired';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3)
                          ],
                          controller: _cvvController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "CVV",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "popins",
                              fontSize: 15,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors
                                      .green), // Green border when focused
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'CVV is required';
                            } else if (value.length != 3) {
                              return 'CVV must be exactly 3 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Save the card information
                        c.toggleAdd(
                          _nameController.text,
                          _cardnumController.text,
                          _expdateController.text,
                          _cvvController.text,
                        );

                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Card saved successfully!')),
                        );

                        // Navigate to Checkout
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOut(),
                          ),
                        );
                      }
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
                          "Save Card",
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
        ),
      ),
    );
  }
}
