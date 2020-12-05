import 'package:Pharmacy/NavBar.dart';
import 'package:Pharmacy/contact.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'Cart.dart';
import 'NavBar.dart';
import 'Items.dart';
import 'log.dart';
import 'address.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: NavBar(1),
      appBar: AppBar(
        title: Text("Pharmacy App"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Items()),
                  );
                },
                color: Colors.red,
                padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                textColor: Colors.white,
                child: const Text('Beauty & Cosmetics',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Items()),
                  );
                },
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                textColor: Colors.white,
                child:
                    const Text('Medications', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Items()),
                  );
                },
                padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Mom & Baby', style: TextStyle(fontSize: 20)),
              ),
            ]),
      ),
    ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Center(child: Text('Hello User'))),
              Container(
                constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    );
                  },
                  color: Colors.blue[200],
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Cart',
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  color: Colors.green[200],
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
                              color: Colors.grey[900],
                            ),
                          ),
                          Icon(
                            Icons.login_outlined,
                            color: Colors.grey[900],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavBar(1),
        appBar: AppBar(
          title: Text("Pharmacy App"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category()));
                  },
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(60, 50, 50, 50),
                  textColor: Colors.white,
                  label: Text(
                    'Shop Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.shopping_cart_sharp, color: Colors.white),
                ),
                const SizedBox(height: 30),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Address()));
                  },
                  color: Colors.red,
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                  textColor: Colors.white,
                  label: Text(
                    'Our Address',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Contact()));
                  },
                  padding: EdgeInsets.fromLTRB(60, 50, 50, 50),
                  color: Colors.green,
                  textColor: Colors.white,
                  label: Text(
                    'Contact us',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.call, color: Colors.white),
                ),
              ]),
        ),
      ),
    );
  }
}
