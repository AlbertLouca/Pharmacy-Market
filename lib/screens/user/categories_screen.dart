import 'package:flutter/material.dart';
import 'package:pharmacynew/old/NavBar.dart';
import 'package:pharmacynew/screens/user/products_screen.dart';
import '../../constants.dart';

class CategoryScreen extends StatelessWidget {
  static String id='CategoriesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: NavBar(1),
          appBar: AppBar(
            backgroundColor: KAppBarColor,
            title: Text("Pharmacy App"),
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,ProductsScreen.id,);
                    },
                    color: KAppBarColor,
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                    textColor: Colors.white,
                    child: const Text('Beauty & Cosmetics',
                        style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 30),
                  RaisedButton(
                    onPressed: () {

                    },
                    color: KAppBarColor,
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    textColor: Colors.white,
                    child:
                    const Text('Medications', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 30),
                  RaisedButton(
                    onPressed: () {

                    },
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                    color: KAppBarColor,
                    textColor: Colors.white,
                    child: const Text('Mom & Baby', style: TextStyle(fontSize: 20)),
                  ),
                ]),
          ),
        );
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
                        MaterialPageRoute(builder: (context) => CategoryScreen()));
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