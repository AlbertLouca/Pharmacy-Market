import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmacynew/constants.dart';
import 'package:pharmacynew/models/Product.dart';
final Firestore _firestore=Firestore.instance;

class Products with ChangeNotifier{


 void addProduct(Product p) {
//print (this.pName);
    _firestore.collection(kProductsCollection).add(

        {
          kProductName: p.pName,
          kProductPrice: p.pPrice,
          kProductDescription: p.pDescription,


        });
    //notifyListeners();
  }
}