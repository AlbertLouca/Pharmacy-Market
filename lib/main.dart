import 'package:pharmacynew/screens/admin/add_Product.dart';
import 'package:pharmacynew/screens/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/screens/admin/manage_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:pharmacynew/screens/login_screen.dart';
import 'package:pharmacynew/screens/user/categories_screen.dart';
import 'package:pharmacynew/screens/user/products_screen.dart';
void main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: ProductsScreen.id,
      routes: {
        Category.id:(context)=>Category(),
        LoginScreen.id:(context)=>LoginScreen(),
        AdminScreen.id:(context)=>AdminScreen(),
        Manage_screen.id:(context)=>Manage_screen(),
        AddProduct.id:(context)=>AddProduct(),
        ProductsScreen.id:(context)=>ProductsScreen(),

      },


    );
  }



}
