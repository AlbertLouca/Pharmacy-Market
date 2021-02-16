import 'package:flutter/material.dart';
import 'package:pharmacynew/screens/admin/add_Product.dart';

import '../../constants.dart';


class Manage_screen extends StatelessWidget {
  @override
  static String id='ManageScreen';
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackGroundColor,
body:Column(
  mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget> [
  SizedBox(
    width: double.infinity,
  ),
  RaisedButton.icon(onPressed: (){
    Navigator.pushNamed(context, AddProduct.id);

  },
      icon: Icon(Icons.add),


      label: Text('Add Product    ')


  ),

  RaisedButton.icon(onPressed: (){}, icon:
  Icon(Icons.edit),


      label: Text('Edit Product    ')


  ),

  RaisedButton.icon(onPressed: (){}, icon:
  Icon(Icons.delete),


      label: Text('Delete Product')


  ),


],

),

    );
  }
}
