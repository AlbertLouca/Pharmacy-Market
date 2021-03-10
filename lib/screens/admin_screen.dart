import 'package:flutter/material.dart';

import '../constants.dart';

class AdminScreen extends StatefulWidget {
  static String id = 'AdminScreen';

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
                child: FlatButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.dashboard,
                    ),
                    label: Text('Dashboard'))),
            Expanded(
                child: FlatButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.sort),
                    label: Text('Manage'))),
          ],
        ),
      ),
    );
  }
}
