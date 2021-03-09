import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/models/Cart.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:pharmacynew/old/NavBar.dart';
import 'package:provider/provider.dart';
import 'products_screen.dart';
import '../../constants.dart';

class Cart_screen extends StatefulWidget {
  static String id = 'CartScreen';


  @override
  _Cart_screenState createState() => _Cart_screenState();


}

class _Cart_screenState extends State<Cart_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: ' Confirm',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.green[800],
        onTap: (index) {
          switch (index) {
            case 0:
              {
                setState(() {

                  Navigator.pushNamed(context,ProductsScreen.id,);


                });
              }
              break;
            case 1:
              {


              }
              break;

          }
        },
      ),
      appBar: AppBar(
        backgroundColor: KAppBarColor,
        title: Text('Checkout'),
        actions: [

          Padding(
              padding: const EdgeInsets.only(right: 40 ,top: 30),
              child: Consumer<Cart>(builder:(context,cart,child){
                return Text('Total: ${cart.get_price()} EGP',style: TextStyle(color: Colors.green,fontSize: 15),);
              })

          )

        ],
      ),
      body: Consumer<Cart>(builder: (context,cart, child){

       return ListView.builder(itemCount: cart.Products.length, itemBuilder: (context, i) {
          return Card(

            child: ListTile(title: //
RichText(
  text:TextSpan(
    text:' ${cart.Products[i].pName}   ',
style: TextStyle(color: Colors.black),
children: <TextSpan>[
  TextSpan(text: ' ${cart.Products[i].pPrice} EGP',style: TextStyle(color: Colors.green)   )
]
  )

),
              trailing: IconButton(icon: Icon(Icons.remove), onPressed: () {
                cart.Removefromcart(cart.Products[i]);

              },),),
          );
        }
        );

      },
      )

      ,

    );
  }
}