import 'package:pharmacynew/screens/admin/EditProduct.dart';
import 'package:pharmacynew/screens/admin/Order_Details.dart';
import 'package:pharmacynew/screens/admin/OrdersScreen.dart';
import 'package:pharmacynew/screens/admin/View_Product.dart';
import 'package:pharmacynew/screens/admin/add_Product.dart';
import 'package:pharmacynew/screens/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/screens/admin/manage_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmacynew/screens/user/Cart_screen.dart';
import 'package:pharmacynew/screens/user/favorites_screen.dart';
import 'package:provider/provider.dart';
import 'package:pharmacynew/screens/Signup_screen.dart';
import 'package:pharmacynew/screens/login_screen.dart';
import 'package:pharmacynew/screens/user/categories_screen.dart';
import 'package:pharmacynew/screens/user/products_screen.dart';
import 'package:pharmacynew/screens/user/location_maps.dart';
import 'package:pharmacynew/screens/user/notification_test.dart';
import 'package:pharmacynew/services/auth.dart';
import 'models/Cart.dart';
import 'screens/user/Profile.dart';
import 'screens/admin/add_Product.dart';
import 'screens/user/products_screen.dart';
void main ()async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => Auth(),
    child: MyApp(),
  ));



}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context){
     return Cart();

    },

    child: MaterialApp(
        debugShowCheckedModeBanner: false,


<<<<<<< Updated upstream
      initialRoute: MyMaps.id,
=======
      initialRoute: OrdersScreen.id,
>>>>>>> Stashed changes

     // initialRoute: SignupScreen.id,





      routes: {
<<<<<<< Updated upstream
        Profile.id:(context)=>Profile(),
=======
        OrdersScreen.id:(context)=>OrdersScreen(),
        OrdersDetails.id:(context)=>OrdersDetails(),
>>>>>>> Stashed changes
        favorites_screen.id:(context)=>favorites_screen(),
        Cart_screen.id:(context)=>Cart_screen(),
        CategoryScreen.id:(context)=>CategoryScreen(),
        SignupScreen.id:(context)=>SignupScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        AdminScreen.id:(context)=>AdminScreen(),
        Manage_screen.id:(context)=>Manage_screen(),
        AddProduct.id:(context)=>AddProduct(),
        ProductsScreen.id:(context)=>ProductsScreen(),
        MyMaps.id: (context) => MyMaps(),
        MyNotification.id: (context) => MyNotification(),
        ViewProduct.id:(context)=>ViewProduct(),
        EditProduct.id:(context)=>EditProduct()
      },


    )
    );  }



}
