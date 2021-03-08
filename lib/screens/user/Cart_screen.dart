import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/models/Cart.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:pharmacynew/old/NavBar.dart';
import 'package:provider/provider.dart';

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

      bottomNavigationBar: NavBar(1),
      appBar: AppBar(
        backgroundColor: KAppBarColor,
        title: Text('Cart'),

      ),
      body: Center(
          child: Wrap(
            children: [


              FlutterLogo(
                size: 70.0,
              ),
              new Chip (
                label: Text('x.pNam', textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25)),

              ),
              // Text( product['Name'], textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black , fontSize: 25)),
              Text('       \n \n ' + "   " + ' EGP',
                  style: TextStyle(color: Colors.green)),
              Text('  '),

              IconButton(
                onPressed: () {


                },

                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,

                ), padding: const EdgeInsets.only(right: 10),

                color: Colors.red[500],
              ),
              Text('    '),
              IconButton(
                onPressed: () {


                },

                icon: Icon(
                  Icons.add,
                  color: Colors.blue,

                ), padding: const EdgeInsets.only(right: 10),

                color: Colors.red[500],
              ),
            ],
          )


      ),


    );
  }


}

class carditem extends StatelessWidget{

  @override
  String name;
  int quantity;
  LineCart(String name, int quantity) {
    this.name=name;
    this.quantity = quantity;
  }
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white24,
        margin: EdgeInsets.all(25.0),
        child: Row(
          children: [
            FlutterLogo(
              size: 60.0,
            ),
            Text(
                '$name                          Quantity: $quantity'),
          ],
        ));
  }
}
Widget Added() {
  List<Widget> list = new List<Widget>();
  for (int key in produc ) {
    list.add(LineCart(key, SelectedItems[key]));
  }
  return new ListView(children: list);
}