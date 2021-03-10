import 'package:flutter/material.dart';
import 'package:pharmacynew/constants.dart';
class GenericTextFeild extends StatelessWidget {

  String hint;
  IconData icon;
  Function onClick;

  String _validateMessage(String str){
switch (hint){
  //here you can do all the validation error messages just by typing  your hint as the case and the error message you want to return as-well
  case 'Product Name':return'Product Name is empty';
  case 'Product Description': return'Product Description is empty';
  case 'Product Price':return'Product Price is empty';


  //case 'Enter Product Name':return'Product Name is empty';
}
  }
  //constructor so you can call this widget at any other page
  GenericTextFeild({@required this.onClick,@required this.icon, @required this.hint});

  @override

  Widget build(BuildContext context) {
return Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
  child: TextFormField(

    validator:(value)
    {   if(value.isEmpty)
      return _validateMessage(hint);

    },
onSaved: onClick,
    cursorColor: Colors.pinkAccent,
    decoration: InputDecoration(
      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[60]),
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color:kBackGroundColor,

      ),
   

    ),



  ),



);



  }
}
