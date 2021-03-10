import 'package:flutter/material.dart';
import 'package:pharmacynew/constants.dart';
import 'package:pharmacynew/screens/admin/add_Product.dart';
import 'package:pharmacynew/screens/user/categories_screen.dart';
import 'package:pharmacynew/screens/user/products_screen.dart';
import 'Profile.dart';
import 'Settings.dart';


class NavBar extends StatefulWidget {
  @override
  int index;
  _NavBarState createState() => _NavBarState(index);
  NavBar(int index) {
    this.index = index;
  }
}

class _NavBarState extends State<NavBar> {
  int index;
  _NavBarState(int index) {
    this.index = index;
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: KAppBarColor,
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
      currentIndex: index,
      onTap: (index) {
        switch (index) {
          case 0:
            {
              setState(() {

                    Navigator.pushNamed(context,Profile.id,);

              });
            }
            break;
          case 1:
            {
              setState(() {

                  Navigator.pushNamed(context,CategoryScreen.id,);


              });

            }
            break;
          case 2:
            {
              setState(() {

                  Navigator.pushNamed(context,AddProduct.id,);

              });
            }
            break;
        }
      },
    );
  }
}
