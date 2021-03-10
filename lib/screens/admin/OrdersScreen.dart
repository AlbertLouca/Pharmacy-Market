
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/models/Cart.dart';
import 'package:pharmacynew/models/Order.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:pharmacynew/models/Products.dart';
import 'package:pharmacynew/screens/admin/Order_Details.dart';
import 'package:pharmacynew/screens/user/Cart_screen.dart';
import 'package:pharmacynew/services/NavBar.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';


class OrdersScreen extends StatefulWidget {
  static String id='OrderScreen';


  final  Firestore= FirebaseFirestore.instance;
  @override
  _OrdersScreenState createState() => _OrdersScreenState();


}

class _OrdersScreenState extends State<OrdersScreen> {

final Products _p=new Products();

  Widget build(BuildContext context) {
    //String title= ModalRoute.of(context).settings.arguments;
    return Scaffold(

        bottomNavigationBar:NavBar(1),
        appBar: AppBar(
          backgroundColor: KAppBarColor,
          title:Text(' Orders '),
          actions: [


          ],  ),


        body: StreamBuilder<QuerySnapshot>(

            stream:_p.loadOrders(),             //which table to read from
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){             // auto update
              if  (!snapshot.hasData){
                return Center(

                  child: Text('No Data to Show'),
                );

              }
              // else  {
              //
              //   List<Order>orders=[];
              //   for (var doc in snapshot.data.docs)
              //   {
              //           orders.add(Order(
              //             oTotalPrice: doc.data[KTotalPrice],
              //             documentID:doc['documentID'],
              //
              //           ));
              //   }
              //
              // }

              return ListView(
                  children: snapshot.data.docs.map((Orders)

                  {
                    Order x=Order(oTotalPrice:Orders['Total price'],documentID: Orders.id,OrderName:Orders[KOrderName],OrderAddress:Orders[KOrderAddress],OrderNumber:Orders[KOrderPhoneNumber] );



                    // items.products.add(x);

                    return Container(

                        height: MediaQuery.of(context).size.height /5,
                        width:  MediaQuery.of(context).size.width * 0.8,

                        margin: EdgeInsets.all(25.0),
                        child: Consumer<Cart>(builder: (context,cart,child){

                          return Wrap (

                            children: [


                              new Chip (

                                label:  Text( spacing(x.OrderName.toString()), style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black , fontSize: 25)),

                              ),

                              Text( '       \n \n '+"   "+x.oTotalPrice.toString()+ ' EGP', style: TextStyle( color:Colors.green)),
                              Text('  '),

                              IconButton(
                                onPressed: (){

                          Navigator.pushNamed(context, OrdersDetails.id,arguments:x.documentID);
                                },

                                icon: Icon(
                                  Icons.info_outline_rounded,
                                  color: Colors.black,

                                ),padding: const EdgeInsets.only(right:10),

                                color: Colors.red[500],
                              ),
                              Text('    '),

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
