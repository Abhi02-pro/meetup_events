import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meetup_events/screens/all_events_screen.dart';
import 'package:meetup_events/screens/login_screen.dart';
import 'package:meetup_events/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meetup Events',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 30),
          bodyMedium: TextStyle(fontSize: 25),
          bodySmall: TextStyle(fontSize: 15)
        )
      ),

      home: const MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  void whereToGo() async {

     var sharedPref = await SharedPreferences.getInstance();
     var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 3),(){
      if(isLoggedIn != Null){
        if(isLoggedIn==true){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MeetupEvents(),));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
        }
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen()
    );
  }
}