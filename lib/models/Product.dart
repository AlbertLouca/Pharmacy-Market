import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmacynew/constants.dart';


class  Product with ChangeNotifier{
  String pName;
  double pPrice;
  String pDescription;
  String pID;
  String pImageURl;
  bool isFavorite;
  String pCategory;
  int pQuantity=1;


Product({this.pName,this.pPrice,this.pDescription,this.pImageURl,this.pCategory,this.pQuantity});

void increasequantity(){

  pQuantity+=1;


}
  void toggleFavoriteStatus(){
    isFavorite =!isFavorite;
    notifyListeners();

  }
}