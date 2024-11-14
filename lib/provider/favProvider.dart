import 'package:flutter/material.dart';

class ProviderFav extends ChangeNotifier{
  List<String> fav1 = [];
  List<int> fav2 = [];
  List<String> fav3 = [];
  List<String> fav4 = [];

  List<String> get img => fav1;
  List<int> get rate => fav2;
  List<String> get name => fav3;
  List<String> get pname => fav4;

  void toggleFav (String img,int rate,String name,String pname){

    final isExist = fav2.contains(rate);
    if (isExist) {
      fav1.remove(img);
      fav2.remove(rate);
      fav3.remove(name);
      fav4.remove(pname);
    } else {
      fav1.add(img);
      fav2.add(rate);
      fav3.add(name);
      fav4.add(pname);
    }
    notifyListeners();
  }
  bool isFavorited(String name) {
    return fav3.contains(name);
  }
}

