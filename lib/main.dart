import 'dart:math';

import 'package:book_appointment/utils/firebase_notification_handler.dart';
import 'package:book_appointment/utils/local_notification_handler.dart';
import 'package:book_appointment/utils/notification_handler.dart';
import 'package:book_appointment/views/Doctor/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

// const String SERVER_ADDRESS = "http://192.168.2.114/Doctor_App/codecanyon-NjBilg7t-doctor-finder-appointment-booking-with-timeslot-app/UploadingContentV2/PHPScript/PHPSCRIPT";
const String SERVER_ADDRESS = "http://ahmed-zidan.drayman.co";

const LANGUAGE = "en";
int PHONE_NUMBER_LENGTH = 10;
const String ADMOB_ID = "ca-app-pub-7803172892594923/5172476997";
const String FACEBOOK_AD_ID = "727786934549239_727793487881917";

const bool ENABLE_ADS = false;
//true -> enable
//false -> disable

const int AD_TYPE = 1;
//0 -> facebook // not working in ios that's why we removed it
//1 -> admob

int LANGUAGE_TYPE = 0;
//0 ---> English
//1 ---> Arabic

///CURRENCY AND CURRENCY CODE
String CURRENCY = "\$";
String CURRENCY_CODE = "INR";

Color WHITE = Colors.white;
Color BLACK = Colors.black;
Color LIGHT_GREY_SCREEN_BACKGROUND = Colors.grey.shade200;
Color LIGHT_GREY_TEXT = Colors.grey.shade500;
Color AMBER = Colors.amber.shade700;
String STRIPE_KEY = "pk_test_yFUNiYsEESF7QBY0jcZoYK9j00yHumvXho";
String TOKENIZATION_KEY = "sandbox_bn2rby52_8x2htw9jqj88wsyf";
//final nativeAdController = NativeAdmobController();
String LANGUAGE_FILE = "en";

SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MyNotificationHandler().x();

  // nativeAdController.setNonPersonalizedAds(true);
  // nativeAdController.setTestDeviceIds(["0B43A6DF92B4C06E3D9DBF00BA6DA410"]);
  // nativeAdController.stateChanged.listen((event) {
  //   print(event);
  // });
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseNotificationHandler.subscribeToAllTopic();

    /* FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });*/

/*
    LocalNotificationHandler.init().then((value) {
    });
*/
    print('SS');
    return MaterialApp(
      locale: Locale('en'),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        timePickerTheme: TimePickerThemeData(
          dayPeriodTextColor: Colors.cyanAccent.shade700,
          //hourMinuteColor: Colors.cyanAccent.shade700,
          helpTextStyle: GoogleFonts.poppins(),
        ),
        accentColor: Colors.cyanAccent.shade700,
        primaryColor: Colors.cyanAccent,
        backgroundColor: Colors.white,
        primaryColorDark: Colors.grey.shade700,
        primaryColorLight: Colors.grey.shade200,
        //highlightColor: Colors.amber.shade700,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(),
          headline2: GoogleFonts.poppins(),
          headline3: GoogleFonts.poppins(),
          headline4: GoogleFonts.poppins(),
          headline5: GoogleFonts.poppins(),
          headline6: GoogleFonts.poppins(),
          subtitle1: GoogleFonts.poppins(),
          subtitle2: GoogleFonts.poppins(),
          caption: GoogleFonts.poppins(
            fontSize: 10,
          ),
          bodyText1:
              GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500),
          bodyText2:
              GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w300),
          button: GoogleFonts.poppins(),
        ),
      ),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('he', ''), // Hebrew, no country code
        const Locale('ar', ''), // Hebrew, no country code
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
    );
  }
}

/*
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Widget> screens = [
    HomeScreen(),
    UserPastAppointments(),
    // LoginAsDoctor(),
    MoreScreen()
  ];

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // nativeAdController.setNonPersonalizedAds(true);
    // nativeAdController.setTestDeviceIds(["0B43A6DF92B4C06E3D9DBF00BA6DA410"]);
    // nativeAdController.stateChanged.listen((event) {
    //   print(event);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  index==0
                      ? "assets/homeScreenImages/home_active.png"
                      : "assets/homeScreenImages/home_unactive.png",
                  height: 25,
                  width: 25,
                ),
                label: HOME,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  index==1
                      ? "assets/homeScreenImages/appointment_active.png"
                      : "assets/homeScreenImages/appointment_unactive.png",
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                ),
                label: APPOINTMENT,
              ),

*/
/*
              BottomNavigationBarItem(
                icon: Image.asset(
                  index==2
                      ? "assets/homeScreenImages/d_l_active.png"
                      : "assets/homeScreenImages/d_l_unactive.png",
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                ),
                label: DOCTOR_LOGIN,
              ),
*/ /*


              BottomNavigationBarItem(
                icon: Image.asset(
                  index==3
                      ? "assets/homeScreenImages/more_active.png"
                      : "assets/homeScreenImages/more_unactive.png",
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                ),
                label: MORE,
              ),
            ],
            selectedLabelStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 8,
            ),
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 7,
            ),
            unselectedItemColor: Colors.grey.shade500,
            selectedItemColor: Colors.black,
            onTap: (i){
              setState(() {
                index = i;
              });
            },
            currentIndex: index,
          ),
        ),
      ),
    );
  }

}

*/
