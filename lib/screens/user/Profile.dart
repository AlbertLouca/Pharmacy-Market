import 'package:flutter/material.dart';
import '../../services/NavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
class Profile extends StatefulWidget {
  @override
  static String id = 'ProfileScreen';
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   var ID,Name,Phone,mail,address,
       Fname,Fmail,FPhone,Faddress;
   getID()async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
 ID=preferences.getString("id");
 //print (ID);

   }
  getName()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     //ID = preferences.getString('id');
      Name = preferences.getString("name");
    // print(Name);
     return Name;
    // mail = preferences.getString("mail");
     //address = preferences.getString("address");

  }
  getPhone()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   Phone = preferences.getString("phone");
   //print (Phone);
   return Phone;

  }
  getMail()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

  mail = preferences.getString("mail");
   // print(mail);
return mail;

  }
  getAddress()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    address = preferences.getString("address");
print (address);
return address;

  }


  @override
  void initState(){
    getID().then((id){

      setState(() {
        ID= id;
      });
    });

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

        appBar: AppBar(
          backgroundColor: KAppBarColor,
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(radius: 200,
                    backgroundColor: Colors.white,
                    child:SizedBox(

                      width: 300.0,
                      height: 150.0,
                      child :Image.network('https://cdn.vox-cdn.com/thumbor/t6_GxiVcx3NNcFHL_q3bwt_weaU=/0x0:720x360/920x0/filters:focal(0x0:720x360):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/13250843/breakdancing_together.jpg',
                          fit:BoxFit.fill),

                    )

                ),
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
                    color:KAppBarColor,
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
