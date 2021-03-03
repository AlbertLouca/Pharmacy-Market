import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmacynew/constants.dart';


class  Product with ChangeNotifier{
  String pName;
  String pPrice;
  String pDescription;
  String pID;
  String pImageURl;
  bool isFavorite;



Product({this.pName,this.pPrice,this.pDescription,this.pImageURl});


  void toggleFavoriteStatus(){
    isFavorite =!isFavorite;
    notifyListeners();

  }
}