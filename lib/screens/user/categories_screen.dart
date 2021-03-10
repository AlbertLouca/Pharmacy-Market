import 'package:flutter/material.dart';
import 'file:///D:/University/Pharmacy-Market/lib/screens/user/NavBar.dart';
import 'package:pharmacynew/screens/user/products_screen.dart';
import '../../constants.dart';
import '../Signup_screen.dart';


class CategoryScreen extends StatelessWidget {
  static String id='CategoriesScreen';


  @override
  Widget build(BuildContext context) {


    return Scaffold(
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
                  Navigator.pushNamed(
                    context,
                    SignupScreen.id,
                  );
                },
                color: Colors.red[200],
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[900],
                          ),
                        ),
                        Icon(
                          Icons.logout,
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
          appBar: AppBar(automaticallyImplyLeading: false,
            backgroundColor: KAppBarColor,
            title: Text("Pharmacy App " ),
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  RaisedButton(
                    onPressed: () {
                     String title='Beauty';
                      Navigator.pushNamed(context,ProductsScreen.id,arguments: title);
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
                      String title='Medication';
                      Navigator.pushNamed(context,ProductsScreen.id,arguments: title ,);
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
                      Navigator.pushNamed(context,ProductsScreen.id,arguments: 'Children' ,);
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

