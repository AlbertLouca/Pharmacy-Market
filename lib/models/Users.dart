import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmacynew/constants.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:pharmacynew/models/user.dart';


class users {

  void addUser (UserModel  u,String ID) {
//print (this.pName);
    FirebaseFirestore.instance.collection(KUserCollection).doc(ID).set(

        {
          KUserName: u.fname,
          KUserEmail: u.email,
          KUserPassword: u.passWord,
          KUserConfirmPassowrd :u.conpassword,
          KUserMobile:u.mobile,
          KUserAddress:u.address


        });
    //notifyListeners();
  }


}