
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacynew/models/Cart.dart';
import 'package:pharmacynew/models/Product.dart';
import 'package:pharmacynew/models/Products.dart';
import 'package:pharmacynew/old/NavBar.dart';
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

  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar:NavBar(1),
        appBar: AppBar(
          backgroundColor: KAppBarColor,
          title:Text('Products'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_bag_rounded),
              onPressed: () {
 //test
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
                    Product x=Product(pName: products['Name'], pPrice: products['Price'], pDescription: products['Description'],pImageURl: products['Image URl']);
                   // x.pName=products['Name']; x.pPrice=products['Price']; x.pDescription=products['Description']; x.pImageURl=products['Image URL'];

                    return Container(

                        height: MediaQuery.of(context).size.height /5,
                        width:  MediaQuery.of(context).size.width * 0.8,

                        margin: EdgeInsets.all(25.0),
                        child: Wrap (
                          children: [


                            FlutterLogo(
                              size: 70.0,
                            ),
                            new Chip (
                              label:  Text( products['Name'], textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black , fontSize: 25)),

                            ),
                            // Text( product['Name'], textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black , fontSize: 25)),
                            Text( '       \n \n '+"   "+products['Price'].toString()+ ' EGP', style: TextStyle( color:Colors.green)),
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
                               // cart.AddtoCart('test');
                              cart.Products.add(x);
                              },

                              icon: Icon(
                                Icons.add,
                                color: Colors.blue,

                              ),padding: const EdgeInsets.only(right:10),

                              color: Colors.red[500],
                            ),
                          ],
                        ));



                  }).toList()

              );


            }



        )
    );


  }
}
//
// Widget _Body(BuildContext context){
//   CollectionReference Products = Firestore.instance.collection(kProductsCollection);
//
//   return FutureBuilder<DocumentSnapshot>(
//     future: Products.
//     builder:
//         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//
//       if (snapshot.hasError) {
//         return Text("Something went wrong");
//       }
//
//       if (snapshot.connectionState == ConnectionState.done) {
//         Map<String, dynamic> data = snapshot.data.data();
//         return Text("Full Name: ${data['full_name']} ${data['last_name']}");
//       }
//
//       return Text("loading");
//     },
//   );
// }
