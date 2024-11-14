import 'package:ayurhealth/provider/addressprovider.dart';
import 'package:ayurhealth/screens/checkOut.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Addaddress extends StatefulWidget {
  const Addaddress({super.key});

  @override
  State<Addaddress> createState() => _AddaddressState();
}

class _AddaddressState extends State<Addaddress> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _AddressController = TextEditingController();
  final TextEditingController _StreetController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _disController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final a = Provider.of<AddressProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add Address",
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
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/361.jpg"),
                      width: double.maxFinite,
                      height: 500,
                      fit: BoxFit.contain,
                    ),
                    TextFormField(
                      controller: _AddressController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Address Line1",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontFamily: "popins", fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: double.maxFinite,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.green), // Green border when focused
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Address Line1 is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _StreetController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Street",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontFamily: "popins", fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: double.maxFinite,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Street is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      controller: _pinController,
                      decoration: InputDecoration(
                        hintText: "Pincode",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontFamily: "popins", fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: double.maxFinite,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.green), // Green border when focused
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pincode is required';
                        } else if (value.length != 6) {
                          return 'Pincode must be 6 digits';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _disController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "District",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontFamily: "popins", fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: double.maxFinite,
                          ),
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
                          return 'District is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Save address info
                          a.toggleAddress(
                            _AddressController.text,
                            _StreetController.text,
                            _pinController.text,
                            _disController.text,
                          );

                          // Navigate to checkout page
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
                            "Save Address",
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
            )),
      ),
    );
  }
}
