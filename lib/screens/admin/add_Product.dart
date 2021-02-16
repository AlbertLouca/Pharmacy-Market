import 'package:flutter/material.dart';
import 'package:pharmacynew/templates/GenericTextFeild.dart';
import 'package:pharmacynew/models/Product.dart';
import '../../constants.dart';
import 'package:pharmacynew/models/Products.dart';
final _product=Product();
class AddProduct extends StatelessWidget {
  static String id='AddProduct';
  String _name,_description;
 String _price;
  final _Products =Products();
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
return Scaffold(
    backgroundColor: kBackGroundColor,

    body :Form(
      key:_globalKey,
      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
   children: <Widget>[
      GenericTextFeild(onClick: (value){
        _name=value;


      }, hint: 'Product Name'),
       SizedBox(height:10),
       GenericTextFeild(onClick: (value){
         _price=value;



       }, hint: 'Product Price'),
       SizedBox(height:10),
       GenericTextFeild(onClick: (value){
         _description=value;

       }, hint: 'Product Description'),
       SizedBox(height:10),

       ButtonTheme(
         minWidth: 80.0,
         height: 60.0,
         child: RaisedButton.icon(
           onPressed: (){if (_globalKey.currentState.validate())
_globalKey.currentState.save();

_Products.addProduct(Product(
  pName: _name,
  pPrice:_price,
  pDescription: _description


));

             },
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(20.0))),
           label: Text('Save',
             style: TextStyle(color: Colors.white),),
           icon: Icon(Icons.add, color:Colors.white,),
           textColor: Colors.white,

           color: Colors.black),
       ),

   ],



),
    )



);
  }
}
