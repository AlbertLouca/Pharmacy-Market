import 'package:Pharmacy/checkout.dart';
import 'package:flutter/material.dart';
import '../Items.dart';
import '../main.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
        child: Added(),
      ),
    );
  }
}

class LineCart extends StatelessWidget {
  @override
  int id;
  int quantity;
  LineCart(int id, int quantity) {
    this.id = id;
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
                'test $id                                    Quantity: $quantity'),
          ],
        ));
  }
}

Widget Added() {
  List<Widget> list = new List<Widget>();
  for (int key in SelectedItems.keys) {
    list.add(LineCart(key, SelectedItems[key]));
  }
  return new ListView(children: list);
}
