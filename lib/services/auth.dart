import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacynew/models/Product.dart';
import 'package:pharmacynew/models/Users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharmacynew/models/http_exception.dart';
import 'package:pharmacynew/models/user.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../constants.dart';


class Auth with ChangeNotifier {
  savePref (String id,String name, String phone,String mail,String address) async{

SharedPreferences preferences = await SharedPreferences.getInstance();
preferences.setString("id", id);
preferences.setString("name", name);
preferences.setString("phone", phone);
preferences.setString("mail", mail);
preferences.setString("address", address);


  }

  String _token;
  DateTime _expiryDate;
  String _userId;
  UserModel user;

  Timer _authTimer;

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

   String get userId {
    return _userId;
  }

  bool get isAuth {
    return token != null;
  }
  users u = new users();

  Future<void> _authenticate(String email, String password, String action,
      {UserModel user}) async {



    try {
      final url =
          'https://identitytoolkit.googleapis.com/v1/accounts:$action?key=AIzaSyBsgZ9Sq-9fxZT8vMSihE31oKfDzNVzsk0';
      final response = await http.post(
        url,
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      final responseData = json.decode(response.body);
      print(responseData['error']);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
          seconds: int.parse(
        responseData['expiresIn'],
      )));
      print('User ID: $_userId');
      await FlutterSession().set("id", _userId);
      print('Token: $_token');
      print('_expiryDate: $_expiryDate');
///////////////////////////////////////////////////////////////////////////////////
      if (action == "signInWithPassword") {
        var url =
            'https://pharmacyapp-629fe-default-rtdb.firebaseio.com/user/$_userId.json';

        var res = await http.get(url);

        final responseData = jsonDecode(res.body);
        if (responseData['error'] != null) {
          throw HttpException(responseData['error']['message']);
        }
        user = UserModel(
            password: responseData['password'], email: responseData['email']);
        print(responseData);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(
            'user_data',
            json.encode({
              "Id": _userId,
              "name": user.fname,
              "email": user.mail,
              "mobile": user.phone,
              "password": user.passWord,
              "conpassword": user.confirm,
              "Address": user.address
            }));

      } else {
        var url =
            'https://pharmacyapp-629fe-default-rtdb.firebaseio.com/user/$_userId.json';
        http.put(
          url,
          body: json.encode(
            {
              "name": user.fname,
              "email": user.mail,
              "mobile": user.phone,
              "password": user.passWord,
              "conpassword": user.confirm,
              "Address": user.address
            },
          ),
        );
         //FlutterSession().set("fname", user.fname);
         //FlutterSession().set("mail", user.mail);
         //FlutterSession().set("phone", user.phone);
         //FlutterSession().set("address", user.address);
        u.addUser(UserModel(

          name: user.fname,
          email: user.mail,
          password: user.passWord,
          conpassword: user.confirm,
          mobile:user.phone,
          address: user.address,

        ),_userId);
        savePref(_userId, user.fname, user.phone, user.mail, user.address);

      }
     
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }


  Future<void> signup(UserModel user, String password) async {
    return _authenticate(user.email, password, "signUp", user: user);
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }

  Future<bool> autoLogin() async {
    if (isAuth) return true;
    final prefs = await SharedPreferences.getInstance();
    print("prefs.containsKey('user_data') ${prefs.containsKey('user_data')}");
    if (!prefs.containsKey('user_data')) {
      return false;
    }
    final savedUserData =
        json.decode(prefs.getString('user_data')) as Map<String, dynamic>;

    print("//Auto Login $savedUserData");
    try {
      user = UserModel(
        id: savedUserData['Id'],
        email: savedUserData['email'],
        name: savedUserData['Fullname'],
        mobile: savedUserData['mobile'],
      );
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
    }
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_data', null);

    _token = null;
    _expiryDate = null;
    _userId = null;
    _authTimer = null;

  }
/*
  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }

    //final timeInSeconds = _expiryDsate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(minutes:60), logout);
  }
*/
}
