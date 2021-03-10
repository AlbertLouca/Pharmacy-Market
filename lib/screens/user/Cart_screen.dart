import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/models/Cart.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:pharmacynew/models/Products.dart';

import 'package:provider/provider.dart';
import 'categories_screen.dart';
import 'products_screen.dart';
import '../../constants.dart';

class Cart_screen extends StatefulWidget {
  static String id = 'CartScreen';

  @override
  _Cart_screenState createState() => _Cart_screenState();
}

class _Cart_screenState extends State<Cart_screen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        backgroundColor: KAppBarColor,
        title: Text('Checkout'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 40, top: 30),
              child: Consumer<Cart>(builder: (context, cart, child) {
                return Text(
                  'Total: ${cart.get_price().roundToDouble()} EGP',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                );
              }
              )
          )
        ],
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {

          return ListView.builder(

              itemCount: cart.Products.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: //
                        RichText(
                            text: TextSpan(
                                text: ' ${cart.Products[i].pName}   ',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                          TextSpan(
                              text: ' ${cart.Products[i].pPrice} EGP',
                              style: TextStyle(color: Colors.green)),
                                  TextSpan(
                                      text: '          X ${cart.Products[i].pQuantity} ',
                                      style: TextStyle(color: Colors.black))
                        ]
                            )
                        ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove,color: Colors.red,),
                      onPressed: () {
                        cart.Removefromcart(cart.Products[i]);
                      },
                    ),
                  ),

                );
              },



              );

        },
      )
      ,floatingActionButton:Consumer<Cart>(
    builder: (context, cart, child) { return RaisedButton(

      onPressed: () {
        Products _p = new Products();
        print (cart.Products);
        print (cart.get_price());
        _p.StoreOrders({
          KTotalPrice:cart.get_price()

        },cart.Products);
        cart.Emptycart();
        _showLoginDialog();

        Timer(Duration(seconds: 2), () {
          setState(() {
            Navigator.pushNamed(
              context,
              CategoryScreen.id,
            );
          });
        });


      },
color: Colors.white,
      child: Text( 'Confirm Order', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.green , fontSize: 25)),
    );
    })
    );
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Successful Confirmation '),
        content: Text('Your order is on the way'),
      ),
    );
  }
}
