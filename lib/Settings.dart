import 'package:flutter/material.dart';
import 'log.dart';
import 'NavBar.dart';

class Settings extends StatelessWidget {
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
                    radius: 80,
                    backgroundImage: AssetImage('build/images/sett.png'),
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
                    constraints: BoxConstraints(
                        maxWidth: 250.0, minHeight: 50.0),
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
                    constraints: BoxConstraints(
                        maxWidth: 250.0, minHeight: 50.0),
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
                    constraints: BoxConstraints(
                        maxWidth: 250.0, minHeight: 50.0),
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login())
                        );
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