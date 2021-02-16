import 'package:flutter/material.dart';
import 'package:pharmacynew/screens/admin/add_Product.dart';
import 'package:pharmacynew/screens/admin/manage_page.dart';
import 'package:pharmacynew/screens/admin_screen.dart';
import 'package:pharmacynew/screens/login_screen.dart';
void main() =>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Manage_screen.id,
      routes: {

        LoginScreen.id:(context)=>LoginScreen(),
        AdminScreen.id:(context)=>AdminScreen(),
        Manage_screen.id:(context)=>Manage_screen(),
        AddProduct.id:(context)=>AddProduct(),


      },


    );
  }



}
