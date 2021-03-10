import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pharmacynew/templates/GenericTextFeild.dart';
import 'package:pharmacynew/models/Product.dart';
import '../../constants.dart';
import 'package:pharmacynew/models/Products.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
final _product=Product();
class AddProduct extends StatefulWidget {
  static String id='AddProduct';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  String _name,_description,_category;

  double _price;

  String _picturePath;
  int randomNumber = Random().nextInt(100000);
  String ID = Random().nextInt(100000).toString();

  final _Products =Products();

  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  File _image;


  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source:ImageSource.gallery);
      setState(() {
        _image=image;

        print('Image Path' + _image.path);
      });
    }
    Future uploadPic(BuildContext context )async{

      String imageLocation = 'product/image${randomNumber}.jpg';
      //String fileName=basename(_image.path);
      firebase_storage.Reference  firebaseStorageRef = firebase_storage.FirebaseStorage.instance.ref().child(imageLocation);
      firebase_storage.UploadTask uploadTask = firebaseStorageRef.putFile(_image);
      await uploadTask;
      //Future.delayed(const Duration(milliseconds: 2000));
      _picturePath= await firebaseStorageRef.getDownloadURL();
      print(_picturePath);


      /* firebaseStorageRef.getDownloadURL().then((fileUrl) {
        setState(()  {
_picturePath=  fileUrl;
print('done'+_picturePath);
        });
      });*/


    }





    return Scaffold(
        backgroundColor: Colors.white,

        body :Form(
          key:_globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: 20.0,),





              CircleAvatar(radius: 100,
                  backgroundColor: Colors.grey,
                  child:ClipOval(

                      child:SizedBox(

                        width: 180.0,
                        height: 180.0,
                        child:(_image!=null)?Image.file(_image,fit:BoxFit.fill):Text(''),

                      )

                  )),

              SizedBox(height:30),

              RaisedButton.icon(onPressed:(){ getImage();}, icon:Icon(Icons.upload_file, color:Colors.grey,) , label:Text('upload image',style: TextStyle(color:Colors.white),)),



              GenericTextFeild(onClick: (value){
                _name=value;


              }, hint: 'Product Name'),
              SizedBox(height:10),
              GenericTextFeild(onClick: (value){
                _category=value;



              }, hint: 'Product Category'),
              SizedBox(height:10),
              GenericTextFeild(onClick: (value){
                _price=double.parse(value);



              }, hint: 'Product Price'),
              SizedBox(height:10),
              GenericTextFeild(onClick: (value){
                _description=value;

              }, hint: 'Product Description'),
              SizedBox(height:10),

              ButtonTheme(
                minWidth: 80.0,
                height: 60.0,
                child: Builder(
                  builder: (context)=>RaisedButton.icon(

                      onPressed: () async{if (_globalKey.currentState.validate())
                        try {
                          await uploadPic(context);

                          //Future.delayed(const Duration(milliseconds: 4000));

                          _globalKey.currentState.save();
                          //uploadPic(context);


                          _Products.addProduct(Product(
                            pCategory: _category,
                              pName: _name,
                              pPrice: _price,
                              pDescription: _description,
                              pImageURl: _picturePath
                              , pQuantity: 1,
                          ));
                          //print('after for loop '+_picturePath);
                          Navigator.pop(context)
                          ;
                        }
                        catch (e) { print(e.toString());
                          if (e.toString().contains('Failed assertion')) {


                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Pls enter a pic"
                              ),
                            ));
                          }
                          else if (e.toString().contains('FormatException: Invalid double')){

                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Please Enter price as a number"
                              ),
                            ));
                          }
                          else {

                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Entered Successfuly"
                              ),
                            ));

                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      label: Text('Save',
                        style: TextStyle(color: Colors.white),),
                      icon: Icon(Icons.add, color:Colors.white,),
                      textColor: Colors.white,

                      color: Colors.cyan),
                ),
              ),

            ],



          ),
        )




    );

  }
}

