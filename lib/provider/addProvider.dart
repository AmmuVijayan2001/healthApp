import 'package:flutter/material.dart';

class AddProvider extends ChangeNotifier{


  List<String> add1=[];
  List<String> add2=[];
  List<String> add3=[];
  List<String> add4=[];

 List<String> get Cname=>add1 ;
 List<String> get Cnum =>add2;
 List<String> get date=>add3;
 List<String> get cvv =>add4;


void toggleAdd (String Cname, String Cnum,String date,String cvv){
  final isCard = add1.contains(Cname);
  if(isCard==false){
    add1.add(Cname);
    add2.add(Cnum);
    add3.add(date);
    add4.add(cvv);
  }
  notifyListeners();
}

}