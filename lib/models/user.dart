import 'Product.dart';

enum AuthMode { Signup, Signin }

class UserModel {
  String token;
   String id;
  String name;
  String email;
  String password;
  String conpassword;
  String mobile;
  String address;

  List <Product> favorites=[];
  UserModel({
    token,
    this.id,
    this.name,
    this.email,
    this.password,
    this.conpassword,
    this.mobile,
    this.address,
  });

 
  String get iD => id;
  bool get isAuth {
    return token != null;
  }

  String get fname {
    return name;
  }

  String get passWord {
    return password;
  }

  String get confirm {
    return conpassword;
  }


  String get phone {
    return mobile;
  }

  String get mail {
    return email;
  }

  String get addres
  {
    return address;
  }
}