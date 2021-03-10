import 'package:flutter/material.dart';
import 'package:pharmacynew/screens/admin/add_Product.dart';
import 'package:pharmacynew/services/auth.dart';
import 'package:pharmacynew/screens/admin/manage_page.dart';
import 'package:pharmacynew/screens/user/categories_screen.dart';
import 'package:pharmacynew/templates/GenericTextFeild.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//Position currentposition;

//var geolocator = Geolocator();

class MyMaps extends StatefulWidget {
  static String id = 'MyMaps';

  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  var locationMessage = '';
  String latitude;
  String longitude;
  String lat2;
  String long2;

  bool loc = false;

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    latitude = "$lat";
    longitude = "$long";

    long2="31.47589924546376";
    lat2="30.044315764165642";

    setState(() {
      locationMessage = "Latitude: $lat and Longitude: $long";
    });
  }

  void googleMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else
      throw ("Couldn't open google maps");
  }
  void googleMaps() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=30.042463362747487,31.475227853912763";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else
      throw ("Couldn't open google maps");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User location application',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 45.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Get User Location",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              /*Text(
                "first get youre location by pressing the first button",
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(
                height: 05.0,
              ),*/
              Text(
                locationMessage,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 05.0,
              ),
              ElevatedButton(
                onPressed: () {
                  getCurrentLocation();
                  loc = true;
                },
                child: Text("Get User Location"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (loc == true) {
                    googleMap();
                  } else {
                    Alert(
                      context: context,
                      title: "No Location Found",
                      desc: "Please press Get user Location and try again.",
                    ).show();
                  }
                },
                child: Text("Open GoogleMap To User Location"),
              ),
               ElevatedButton(
                onPressed: () {
                  googleMaps();
                  
                },
                child: Text("Open GoogleMap To The Pharmacy Location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
