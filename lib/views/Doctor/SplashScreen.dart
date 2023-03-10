import 'dart:async';
import 'dart:convert';

import 'package:book_appointment/main.dart';
import 'package:book_appointment/views/Doctor/DoctorTabScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DoctorAppointmentDetails.dart';
import '../UserAppointmentDetails.dart';
import 'loginAsDoctor.dart';

FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isTokenAvailable = false;
  String token;

  getToken() async {
    SharedPreferences.getInstance().then((pref) {
      if (pref.getBool("isTokenExist") ?? false) {
        Timer(Duration(seconds: 2), () {
          if (pref.getBool("isLoggedInAsDoctor") ?? false) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DoctorTabsScreen()));
          } else if (pref.getBool("isLoggedIn") ?? false) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginAsDoctor()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginAsDoctor()));
          }
        });
      } else {
        print("value is null");
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginAsDoctor()));
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  storeToken() async {
    final response =
        await post(Uri.parse("$SERVER_ADDRESS/api/savetoken"), body: {
      "token": token,
      "type": "1",
    }).catchError((e) {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginAsDoctor()));
      });
    });
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success'] == "1") {
        Timer(Duration(seconds: 2), () {
          SharedPreferences.getInstance().then((pref) {
            pref.setBool("isTokenExist", true);
            print("token stored");
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginAsDoctor()));
          });
        });
      }
    } else {
      print("token not stored");
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginAsDoctor()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/splash.png",
        fit: BoxFit.fill,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

// FirebaseMessaging().getToken().then((value){
//   //Toast.show(value, context, duration: 2);
//   print(value);
//   setState(() {
//     token = value;
//   });
//
// }).catchError((e){
//   print("token not generated "+ e.toString());
//   Timer(Duration(seconds: 2),(){
//     Navigator.pushReplacement(context,
//         MaterialPageRoute(builder: (context) => TabsScreen())
//     );
//   });
// });
