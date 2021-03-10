import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmacynew/screens/user/categories_screen.dart';
import 'package:pharmacynew/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:pharmacynew/screens/Signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final myController = TextEditingController();

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

  void _showLoginDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Logging  in ..'),
        content: Text(message),
      ),
    );
  }

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
                      'Login!',
                      style: TextStyle(color: Colors.blue[300], fontSize: 40),
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
                      validator: (value) {
                        if (value.isEmpty || value.length < 8) {
                          return value.isEmpty
                              ? "The Password is invalid"
                              : null;
                        }
                        return null;
                      },
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                    )),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      try {
                        await Provider.of<Auth>(context, listen: false)
                            .login(_email.text, _password.text);
                        if (_formKey.currentState.validate()) {
                          _showLoginDialog('Welcome, Redirecting in 5');
                          Timer(Duration(seconds: 4), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(),
                              ),
                            );
                          });
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
                  child: Text('Sign in'),
                ),
                RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        SignupScreen.id,
                      );
                    },
                    child: Text('New User? Sign Up Here!')),
              ],
            ),
          )),
    );
  }
}
