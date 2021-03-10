import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmacynew/models/Products.dart';
import 'package:provider/provider.dart';
import 'Product.dart';


class Cart with ChangeNotifier{
  int id;
  List <Product> Products=[];

  double _price=0.0;
  int _count =0;

void AddtoCart(Product item){
if(Products==null){
  List <Product> Products=[item];

}
else {
  Products.add(item);

}

_price+=item.pPrice;
_count+=1;

  notifyListeners();
}
  void Removefromcart(Product item){

      Products.remove(item);



    _price-=item.pPrice;
    _count-=1;

    notifyListeners();
  }
  void Emptycart(){

    Products.clear();




    _price=0;
    _count=0;

    notifyListeners();
  }
int get_count(){
  return _count;
}
double get_price(){
  return _price;
}
void inc_count(){
  _count+=1;
  notifyListeners();
}
}