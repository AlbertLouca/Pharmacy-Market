import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmacynew/constants.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:firebase_core/firebase_core.dart';

final  _firestore= FirebaseFirestore.instance;

class Products with ChangeNotifier{
  List <Product> products = [];

 void addProduct(Product p) {
//print (this.pName);
   FirebaseFirestore.instance.collection(kProductsCollection).add(

        {
          kProductName: p.pName,
          kProductPrice: p.pPrice,
          kProductDescription: p.pDescription,
          kProductImageUrl :p.pImageURl


        });
    //notifyListeners();
  }




   }




