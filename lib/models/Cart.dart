import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'Product.dart';


class Cart with ChangeNotifier{
  int id;
  List <Product> Products=[];
double _price=0.0;
int _count =0;

void AddtoCart(Product item){

  Products.add(item);


_price+=item.pPrice;
_count+=1;
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