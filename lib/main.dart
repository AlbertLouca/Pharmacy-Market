import 'package:assinment_2/NavBar.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'Settings.dart';
import 'NavBar.dart';
import 'Items.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
      appBar: AppBar(
        title: Text("Pharmacy App"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Items()),
                );},
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
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Items()),
                );},
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
        bottomNavigationBar:NavBar(1),



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
                  color: Colors.green,
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
                  onPressed: () {},
                  color: Colors.green,
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
                  onPressed: () {},
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




