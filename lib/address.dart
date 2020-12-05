import 'package:flutter/material.dart';
import 'NavBar.dart';

class Address extends StatelessWidget {
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
            Text('Addresses',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
              child: Text(
                  ' -> 2098 road 9 ndc compound sta. mesa, manila philippines '),
            ),
          ],
        ),
      ),
    ));
  }
}
