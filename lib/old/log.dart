import 'package:flutter/material.dart';
import 'NavBar.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController emailCon = new TextEditingController();
  final TextEditingController passCon = new TextEditingController();
  

  String email = "";
  String password = "";


   LoginPageState() {
    emailCon.addListener(emailListener);
    passCon.addListener(passwordListener);
  }
 
 void emailListener() {
    if (emailCon.text.isEmpty) {
      email = "";
    } else {
      email = emailCon.text;
    }
  }

  void passwordListener() {
    if (passCon.text.isEmpty) {
      password = "";
    } else {
      password = passCon.text;
    }
  }

  FormType form = FormType.login;
  void formChange() async {
    setState(() {
      if (form == FormType.register) {
        form = FormType.login;
      } else {
        form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: NavBar(0),
      appBar: buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            buildTextFields(),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Login"),
      centerTitle: true,
    );
  }

  Widget buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
               controller: emailCon,
              decoration: new InputDecoration(labelText: 'Email'),
              //obscureText: true,
            ),
          ),
          new Container(
            child: new TextField(
              controller: passCon,
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget buildButtons() {
    if (form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(emailCon.text),
              );
            },
          );
              },
            ),
            new FlatButton(
              child: new Text('Dont have an account? Tap here to register.'),
              onPressed: formChange,
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: pressedForgot,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create an Account'),
              onPressed: createAccountPressed,
            ),
            new FlatButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: formChange,
            )
          ],
        ),
      );
    }
  }

  void pressedForgot() {
    print('Forgot Button was pressed');
  }

  void createAccountPressed() {
    print('The user wants to create an account');
  }

  void pressedLogin() {
    print('Login Button was pressed');
  }
}
