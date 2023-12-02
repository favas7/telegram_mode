// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/login.dart';
import 'package:flutter_application_3/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
  void initState() { 
    checkUserLoggedIn();
    super.initState();
    
  }
  
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Center(
          child: Container(
            height: 80,
            width: 80,
            decoration:  const BoxDecoration(
              image: DecorationImage(
                 alignment: Alignment.center,
                image: AssetImage(
                  'asset/images/Telegram_IconLogo_PNG_Image.jpeg'),
              ),
              ),
          ),
        ),
      ),
    );
  }

             
    @override
    Future<void>gotoLogin()async{
      await Future.delayed(const Duration(seconds: 3));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const ScreenLogin(),
      ),
      );
    }

  Future<void>checkUserLoggedIn()async{
   final sharedPrefs = await SharedPreferences.getInstance();
   final userLoggedIn = sharedPrefs.getBool(save_Key_Value);
   if(userLoggedIn==null||userLoggedIn== false){
    gotoLogin();
   }else{
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=>const HomeScreen(),
    ),
    );
   }
  }
}