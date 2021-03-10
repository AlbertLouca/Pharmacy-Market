import 'package:flutter/material.dart';
import 'package:pharmacynew/screens/user/products_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import '../Signup_screen.dart';
import '../../services/NavBar.dart';
import 'package:pharmacynew/screens/user/Cart_screen.dart';

class CategoryScreen extends StatefulWidget {
  static String id='CategoriesScreen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}


class _CategoryScreenState extends State<CategoryScreen> {
  var Name,Fname;
  getName()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Name = preferences.getString("name");
    return Name;

  }
  @override
  void initState(){

    getName().then((name){

      setState(() {
        Fname= name;
      });
    });

    super.initState();

    //print('Name form init state'+Name);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Center(child: Text('Hello '+Fname))),
            Container(
              constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () {

                  Navigator.pushNamed(context, Cart_screen.id);
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

