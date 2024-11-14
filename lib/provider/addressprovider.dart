import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier{

  List<String> Address1=[];
  List<String> Address2=[];
  List<String> Address3=[];
  List<String> Address4=[];

  List<String> get Addressline1=>Address1;
  List<String> get Street=>Address2;
  List<String> get Pincode=>Address3;
  List<String> get district=>Address4;

  void toggleAddress(String Addressline1 ,String  Street,String Pincode,String district ){
    final isAddress=Address1.contains(Addressline1);
    if(!isAddress){
      Address1.add(Addressline1);
      Address2.add(Street);
      Address3.add(Pincode);
     Address4.add(district) ;
    }
    notifyListeners();

  }


}