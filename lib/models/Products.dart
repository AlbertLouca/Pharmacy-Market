
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmacynew/constants.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:firebase_core/firebase_core.dart';

final  _firestore= FirebaseFirestore.instance;

class Products  with ChangeNotifier{
  List <Product> products = [];

 void addProduct(Product p) {
//print (this.pName);
   FirebaseFirestore.instance.collection(kProductsCollection).add(

        {
          kProductName: p.pName,
          kProductPrice: p.pPrice,
          kProductDescription: p.pDescription,
          kProductImageUrl :p.pImageURl,
          kProductCategory:p.pCategory,
          kProductQuantity:p.pQuantity,
        });
    //notifyListeners();
  }



  updateProduct(data,documentID)async{

   _firestore.collection(kProductsCollection).doc(documentID).update(data);
    //CollectionReference  collectionReference =FirebaseFirestore.instance.collection(kProductsCollection).where(kProductName, isEqualTo: name);
   // QuerySnapshot querySnapshot =await collectionReference.get();
    //querySnapshot.docs[0].reference.update({kProductImageUrl:Url});



  }

  deleteProduct(documentId)
  {
    _firestore.collection(kProductsCollection).doc(documentId).delete();


  }
  StoreOrders(data,List<Product>products)
  {
    var documentRef=_firestore.collection(KOrdersCollection).doc();
    documentRef.set(data);
    for(var product in products) {
      documentRef.collection(KOrderDetais).doc().set(
        {kProductName:product.pName,
          kProductPrice:product.pPrice,
          KProductQuantity:product.pQuantity,


        }

      );



    }
  }
  Stream<QuerySnapshot>loadOrders(){
   return _firestore.collection(KOrdersCollection).snapshots();

  }
  Stream<QuerySnapshot>loadOrderDetails(documentID){
    return _firestore.collection(KOrdersCollection).doc(documentID).collection(KOrderDetais).snapshots();

  }



}




