
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/models/Cart.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:pharmacynew/models/Products.dart';
import 'file:///D:/University/Pharmacy-Market/lib/screens/user/NavBar.dart';
import 'package:pharmacynew/screens/user/Cart_screen.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';


class ProductsScreen extends StatefulWidget {
  static String id='ProductScreen';


  final  Firestore= FirebaseFirestore.instance;
  @override
  _ProductsscreenState createState() => _ProductsscreenState();


}

class _ProductsscreenState extends State<ProductsScreen> {

  Cart cart;
  Products items;

  Widget build(BuildContext context) {
   String title= ModalRoute.of(context).settings.arguments;
    return Scaffold(

        bottomNavigationBar:NavBar(1),
        appBar: AppBar(
          backgroundColor: KAppBarColor,
          title:Text('$title Products '),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_bag_rounded),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cart_screen()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Consumer<Cart>(builder:(context,cart,child){
                return Text('${cart.get_count()}');
              })

            )

          ],  ),


        body: StreamBuilder(

            stream:FirebaseFirestore.instance.collection(kProductsCollection).snapshots(),             //which table to read from
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){             // auto update
              if  (!snapshot.hasData){
                return Center(

                  child: Text('No Data to Show'),
                );

              }

              return ListView(
                  children: snapshot.data.docs.map((products){
                    Product x=Product(pName: products['Name'], pPrice: products['Price'], pDescription: products['Description'],pImageURl: products['Image URl'],pCategory: products['Category']);


                    if(x.pCategory!= title){
                      
                      return Text('');
                    }
                   // items.products.add(x);

                    return Container(

                        height: MediaQuery.of(context).size.height /5,
                        width:  MediaQuery.of(context).size.width * 0.8,

                        margin: EdgeInsets.all(25.0),
                        child: Consumer<Cart>(builder: (context,cart,child){

                          return Wrap (

                            children: [
                              CircleAvatar(radius: 30,
                                child:ClipOval(

                                    child:SizedBox(

                                      width: 150.0,
                                      height: 150.0,
                                      child :Image.network(x.pImageURl,
                                          fit:BoxFit.fill),

                                    )

                                ),

                              ),


                              new Chip (

                                label:  Text( spacing(x.pName), style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black , fontSize: 25)),

                              ),

                              Text( '       \n \n '+"   "+x.pPrice.toString()+ ' EGP', style: TextStyle( color:Colors.green)),
                              Text('  '),

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


                                  cart.AddtoCart(x);

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
