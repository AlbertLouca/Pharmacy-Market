import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyNotification());

class MyNotification extends StatefulWidget {
  static String id = 'MyNotification';
  @override
  MyNotificationstate createState() => MyNotificationstate();
}

class MyNotificationstate extends State<MyNotification> {
  String _message = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Message: $_message"),
              ]),
        ),
      ),
    );
  }
}
