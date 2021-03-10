import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmacynew/models/Users.dart';
import 'package:pharmacynew/models/http_exception.dart';
import 'package:pharmacynew/screens/login_screen.dart';
import 'package:pharmacynew/screens/user/location_maps.dart';
import 'package:pharmacynew/services/auth.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'package:pharmacynew/models/user.dart';
import 'package:pharmacynew/screens/login_screen.dart';
import 'package:pharmacynew/screens/user/location_maps.dart';

//import 'package:firebase_database/firebase_database.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'SignupScreen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
/*Widget build(BuildContext context) {
    create: (context) => Auth();
    final deviceDimenions = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackGroundColor,
        body:SafeArea(
          child: MyCustomForm() ,
        )

    );


  }*/
}
/*class MyCustomForm extends StatefulWidget {
  @override
   //final Auth auth = new Auth();
  _MyCustomFormState createState() => _MyCustomFormState();
}*/

class _SignupScreenState extends State<SignupScreen> {
  Auth a = new Auth();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  //var _isLoading = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();

  final myController = TextEditingController();
  users U = new users();
  Auth b = new Auth();

  //final FirebaseDatabase database = FirebaseDatabase.getInstance();
  //DatabaseReference ref = database.getReference("server/saving-data/fireblog/posts");

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Oops! An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  void _showSignupDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Registeration Succesfull'),
        content: Text(message),
      ),
    );
  }

  /*Future<void> _submit() async {
    if (_formKey.currentState.validate())
     {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });


    setState(() {
      _isLoading = false;
    });
  }*/
  Widget build(BuildContext context) {
    create:
    (context) => Auth();
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(30),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.blue[300],
                          //fontWeight: FontWeight.w500,
                          fontSize: 50),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter valid name';
                        }
                        return null;
                      },
                      controller: _name,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: 'Name'),
                    )),

/*mail*/ Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'E-mail'),
                    )),

/*pass*/ Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      key: _passwordFieldKey,
                      validator: (value) {
                        if (value.isEmpty || value.length < 8) {
                          return value.isEmpty
                              ? "The Password is too short"
                              : null;
                        }
                        return null;
                      },
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                    )),

                /*con-pas*/ Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value !=
                            _passwordFieldKey
                                .currentState.value /*||value.isEmpty */) {
                          return 'Password do not match';
                        }
                        return null;
                      },
                      controller: _confirmpassword,
                      obscureText: true,
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                    )),

                /*Mobile*/ Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty || !(value.length == 11)) {
                          return value.isEmpty ? "The Number is invalid" : null;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      controller: _mobile,
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        /*hintText: 'Enter Phone Number Here'*/
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter valid address';
                        }
                        return null;
                      },
                      controller: _address,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(labelText: 'Home Address'),
                    )), RaisedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyMaps(),
                    ),

                  );

                },
                    child: Text('Find My Address'),
                ),
                RaisedButton(
                  onPressed: () async {
                    print(_email.text);
                    print(_mobile.text);
                    print(_password.text);
                    print(_name.text);
                    print(_confirmpassword.text);
                    print(_address.text);

                    if (_formKey.currentState.validate()) {
                      try {
                        await Provider.of<Auth>(context, listen: false).signup(
                            UserModel(
                              name: _name.text,
                              email: _email.text,
                              password: _password.text,
                              conpassword: _confirmpassword.text,
                              mobile: _mobile.text,
                              address: _address.text,
                            ),
                            _password.text);
                        if (_formKey.currentState.validate()) {
                          // String key = mDatabase.child("posts").push().getKey();

                          _showSignupDialog('Welcome, Redirecting in 5');

                          Timer(Duration(seconds: 5), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          });
                          /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(),
                      ),
                    );*/
                        }
                      } catch (error) {
                        print(error.toString());

                        var errorMessage = 'Authentication failed';

                        if (error.toString().contains('EMAIL_EXISTS')) {
                          errorMessage =
                              'This email address is already in use.';
                        } else if (error.toString().contains('INVALID_EMAIL')) {
                          errorMessage = 'This is not a valid email address';
                        } else if (error
                            .toString()
                            .contains('EMAIL_NOT_FOUND')) {
                          errorMessage =
                              'Could not find a user with that email.';
                        } else if (error.toString().contains('WEAK_PASSWORD')) {
                          errorMessage = 'This password is too weak.';
                        } else if (error
                            .toString()
                            .contains('INVALID_PASSWORD')) {
                          errorMessage = 'Invalid password.';
                        } else if (error
                            .toString()
                            .contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
                          errorMessage = 'Please Try Again Later.';
                        } else if (error.toString().contains('USER_DISABLED')) {
                          errorMessage =
                              'Account Disabled, Contact Adminstator.';
                        }

                        _showErrorDialog(errorMessage);
                      }
                    }
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text('Sign up'),
                ),
                RaisedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),

                  );

                },
                    child: Text('Already Have an Account?'),
                )
              ],
            ),
          )),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                validator: (value) {
            if (value.isEmpty) {
              print( 'Please enter your e-mail');
            }
            return null;
           },
                style: TextStyle(color: Colors.white),
                controller: _email,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
           },
                style: TextStyle(color: Colors.white),
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                  await register(_email.text, _password.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(),
                      ),
                    );
                  }
                },
                child: Text("Register"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                   onPressed: () async {
                  bool shouldNavigate =
                  await signIn(_email.text, _password.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProduct(),
                      ),
                    );
                  }
                },
                  child: Text("Login")),
            ),
          ],
        ),
      ),
    );
  }*/
}
