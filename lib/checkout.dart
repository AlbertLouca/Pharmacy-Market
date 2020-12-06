import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'cart.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: NavBar(1),
      appBar: AppBar(
        title: Text("Pharmacy App"),
      ),
      body: Center(
        child: ListView(
          children: [
            Text('Done',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
              child: Text(
                  ' Your order was received and will arrive Shortly your total was: 50 LE '),
            ),
          ],
        ),
      ),
    ));
  }
}
