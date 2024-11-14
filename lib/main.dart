import 'package:ayurhealth/provider/addProvider.dart';
import 'package:ayurhealth/provider/addressprovider.dart';
import 'package:ayurhealth/provider/cartProvider.dart';
import 'package:ayurhealth/provider/favProvider.dart';
import 'package:ayurhealth/screens/splashscrn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProviderFav()),
          ChangeNotifierProvider(create: (context) => Providerr()),
          ChangeNotifierProvider(create: (context) => AddProvider()),
          ChangeNotifierProvider(create: (context) => AddressProvider(),
          ) // Add other providers here if needed
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splsh_Scrn(),
        ));
  }
}
