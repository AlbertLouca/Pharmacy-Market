import 'package:flutter/material.dart';
import 'package:pharmacynew/screens/admin/EditProduct.dart';
import 'package:pharmacynew/screens/admin/OrdersScreen.dart';
import 'package:pharmacynew/screens/admin/View_Product.dart';
import 'package:pharmacynew/screens/admin/add_Product.dart';

import '../../constants.dart';


class Manage_screen extends StatelessWidget {
  @override
  static String id='ManageScreen';
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: KAppBarColor,
body:Column(
  mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
children: [
  ListBody(
    children:     <Widget> [
      SizedBox(
    
        width: double.infinity,
      ),


      ElevatedButton.icon(onPressed: (){
        Navigator.pushNamed(context, AddProduct.id);
    
      },
    
          icon: Icon(Icons.add),
    
    
          label: Text('Add Product    ')
    
    
      ),  ElevatedButton.icon(onPressed: (){
        Navigator.pushNamed(context, OrdersScreen.id);
    
      },
          icon: Icon(Icons.shopping_bag_rounded),
    
    
          label: Text('Manage orders  ')
    
    
      ),
    
      ElevatedButton.icon(onPressed: (){
        Navigator.pushNamed(context, ViewProduct.id);
    
      }, icon:
      Icon(Icons.view_agenda_rounded),
    
    
          label: Text(' Edit  / Delete    ')
    
    
      ),
    
    
    
    
    ],
  ),
],

),

    );
  }
}
