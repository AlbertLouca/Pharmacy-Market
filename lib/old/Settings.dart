import 'package:flutter/material.dart';
import '../log.dart';
import '../NavBar.dart';
import 'NavBar.dart';

class Settings extends StatefulWidget {
  @override
  _MySettings createState() => _MySettings();
}

class _MySettings extends State<Settings> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 7),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: NavBar(2),
      appBar: AppBar(
        title: Text("Pharmacy App"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 55,
                child: new AnimatedBuilder(
                  animation: animationController,
                  child: new Container(
                    child: new Image.asset('build/images/sett.png'),
                  ),
                  builder: (BuildContext context, Widget _widget) {
                    return new Transform.rotate(
                      angle: animationController.value * 6.3,
                      child: _widget,
                    );
                  },
                ),
              ),
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blue[200],
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[900],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey[900],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blue[200],
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[900],
                            ),
                          ),
                          Icon(
                            Icons.lock,
                            color: Colors.grey[900],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {

                  },
                  color: Colors.green[400],
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    ));
  }
}
