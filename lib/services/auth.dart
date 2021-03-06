import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacynew/models/Users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharmacynew/models/http_exception.dart';
import 'package:pharmacynew/models/user.dart';
import 'package:provider/provider.dart';

class Auth with ChangeNotifier {
  savePref(
      String id, String name, String phone, String mail, String address) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("id", id);
    preferences.setString("name", name);
    preferences.setString("phone", phone);
    preferences.setString("mail", mail);
    preferences.setString("address", address);

  }
  isadmin(bool b) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool("isadmin", b);
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
      print('wslt');
      print(responseData['email']);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
          seconds: int.parse(
        responseData['expiresIn'],
      )));
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
        print('user id ' + _userId);

        savePref(_userId, responseData['name'], responseData['mobile'],
            responseData['email'], responseData['Address']);

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
              "Address": user.address,
              "Admin" : user.admn 
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
              "Address": user.address,
              "Admin" : user.admn
            },
          ),
        );

        u.addUser(
            UserModel(
              name: user.fname,
              email: user.mail,
              password: user.passWord,
              conpassword: user.confirm,
              mobile: user.phone,
              address: user.address,
              admin: false,
            ),
            _userId);
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
    try {
      user = UserModel(
        id: savedUserData['Id'],
        email: savedUserData['email'],
        name: savedUserData['Fullname'],
        mobile: savedUserData['mobile'],
        address: savedUserData['address'],
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
    savePref(null, null, null, null, null);

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
