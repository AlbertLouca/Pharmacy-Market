
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/models/Cart.dart';
import 'package:pharmacynew/models/Order.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:pharmacynew/models/Products.dart';
import 'package:pharmacynew/NavBar.dart';
import 'package:pharmacynew/screens/user/Cart_screen.dart';
import 'package:pharmacynew/services/NavBar.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';


class OrdersDetails extends StatefulWidget {
  static String id='OrderDetails';


  final  Firestore= FirebaseFirestore.instance;
  @override
  _OrdersDetailsState createState() => _OrdersDetailsState();


}

class _OrdersDetailsState extends State<OrdersDetails> {
  final Products _p=new Products();

  //final Products _p=new Products();

  Widget build(BuildContext context) {
    String documentID= ModalRoute.of(context).settings.arguments;

    return Scaffold(

        bottomNavigationBar:NavBar(1),
        appBar: AppBar(
          backgroundColor: KAppBarColor,
          title:Text('Order Details '),
          actions: [


          ],  ),


        body: StreamBuilder<QuerySnapshot>(

            stream:_p.loadOrderDetails(documentID),             //which table to read from
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){             // auto update
              if  (!snapshot.hasData){
                return Center(

                  child: Text('No Data to Show'),
                );

              }

              return ListView(
                  children: snapshot.data.docs.map((details){
                    Product p=Product(pName: details[kProductName],pPrice: details[kProductPrice],pQuantity: details[KProductQuantity]);



                    // items.products.add(x);

                    return Container(

                        height: MediaQuery.of(context).size.height /5,
                        width:  MediaQuery.of(context).size.width * 0.8,

                        margin: EdgeInsets.all(25.0),
                        child: Consumer<Cart>(builder: (context,cart,child){

                          return Wrap (

                            children: [


                              new Chip (

                                label:  Text( spacing(p.pName), style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black , fontSize: 25)),

                              ),

                              Text( '       \n \n '+"   "+p.pPrice.toString()+ ' EGP', style: TextStyle( color:Colors.green)),
                              Text( '       \n \n '+"   "+p.pQuantity.toString()+ ' EGP', style: TextStyle( color:Colors.green)),

                              IconButton(
                                onPressed: (){


                                },

                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.black,

                                ),padding: const EdgeInsets.only(right:10),

                                color: Colors.red[500],
                              ),
                              Text('    '),
                              IconButton(
                                onPressed: (){


                                  //cart.AddtoCart(x);

                                },

                                icon: Icon(
                                  Icons.add,
                                  color: Colors.blue,

                                ),padding: const EdgeInsets.only(right:10),

                                color: Colors.red[500],
                              ),
                            ],
                          );
                        }
                        )

                    );



                  }).toList()

              );


            }



        )
    );


  }
}
String spacing(String x){
  String y='';
  if(x.length>10){
    y= x.substring(0,9);
    y=y+"...";
    return y;
  }
  else {
    return x;
  }


}
