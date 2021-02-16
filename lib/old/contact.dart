import 'package:flutter/material.dart';
import '../NavBar.dart';

class Contact extends StatelessWidget {
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
            Text('Contact Us',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
              child: Text(' Call Us ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Text(
              '• 01256354387',
              textAlign: TextAlign.center,
            ),
            Text(
              '• 01256354388',
              textAlign: TextAlign.center,
            ),
            Text(
              '• 170053',
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
              child: Text(' Reach Us ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Text(
              '• Support@hotmail.com',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ));
  }
}
