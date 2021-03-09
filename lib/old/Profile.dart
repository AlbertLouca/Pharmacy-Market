import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   var ID,Name,Phone,mail,address,
       Fname,Fmail,FPhone,Faddress;
  getName()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     //ID = preferences.getString('id');
     return Name = preferences.getString("name");
     mail = preferences.getString("mail");
     address = preferences.getString("address");

  }
  getPhone()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   return Phone = preferences.getString("phone");

  }
  getMail()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   return mail = preferences.getString("mail");

  }
  getAddress()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return address = preferences.getString("address");


  }

  @override
  void initState(){

getName().then((name){

  setState(() {
    Fname= name;
  });
});
getPhone().then((phone){

  setState(() {
    FPhone  = phone;
  });
});
getMail().then((mail){

  setState(() {
    Fmail= mail;
  });
});
getAddress().then((address){

  setState(() {
    Faddress= address;
  });
});



    super.initState();


    //print('Name form init state'+Name);
  }

  @override
  Widget build(BuildContext context) {
    //print ('Name form build '+Name);
    //getPref(ID,Name,Phone,mail,address);
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavBar(0),
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
             
                Text(
                  Fname,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Fmail,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[300],
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                Text('Welcome '+Fname,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        FPhone,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    )),
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.map,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      Faddress,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
