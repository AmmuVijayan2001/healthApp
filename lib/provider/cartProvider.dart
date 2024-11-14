import 'package:flutter/material.dart';

class Providerr extends ChangeNotifier {

  List<String> fav1 = [];
  List<int> fav2 = [];
  List<String> fav3 = [];
  List<String> fav4 = [];



  List<String> get img1 => fav1;
  List<int> get rate1 => fav2;
  List<String> get name => fav3;
  List<String> get pname => fav4;


  //
  void toggleFavorite(String img1, int rate1, String name, String pname) {
    final isExist = fav2.contains(rate1);
    if (isExist) {
      fav1.remove(img1);
      fav2.remove(rate1);
      fav3.remove(name);
      fav4.remove(pname);
    } else {
      fav1.add(img1);
      fav2.add(rate1);
      fav3.add(name);
      fav4.add(pname);
    }
    notifyListeners();
  }

  bool isCart(String name) {
    return fav3.contains(name);
  }



  int get fav1Length=>fav1.length;



}
