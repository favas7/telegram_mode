import 'package:flutter/material.dart';
import 'package:flutter_application_3/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences sharedpref;

// ignore: constant_identifier_names
const save_Key_Value = 'UserLoggedIn';

void main(){
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const  SplashScreen(),
    );
  }
}