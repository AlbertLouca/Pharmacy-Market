import 'package:flutter/material.dart';
import 'Profile.dart';
import 'Settings.dart';
import 'main.dart';



class NavBar extends StatefulWidget {
  @override
  int index;
  _NavBarState createState() => _NavBarState(index);
  NavBar(int index){
    this.index=index;


  }
}

class _NavBarState extends State<NavBar> {
  int index ;
  _NavBarState(int index){

   this.index=index;
  }
  @override

  Widget build(BuildContext context) {
    return BottomNavigationBar(  items: const <BottomNavigationBarItem>[
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


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),

                );
              });



            }
            break;
          case 1:
            {
              setState(() {

              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>Home()),
              );

            }
            break;
          case 2:
            {
              setState(() {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Settings()),
                );
              });


            }
            break;
        }
      },
    );


  }
}