// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScreenLogin extends StatefulWidget {
   const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  //final TextEditingController _textEditingController=TextEditingController();
  final TextEditingController  _textcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final _formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Your Phone Number',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 17, 11, 11)),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                      'Please confirm Your Country code \n and enter your phone number',
                      style:
                          TextStyle(color: Color.fromARGB(255, 105, 102, 102))
                          ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: TextEditingController(text: 'india'),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: const Text(
                          'country',
                          style: TextStyle(fontSize: 15),
                        ),
                        prefixIcon: const Icon(Icons.flag_sharp),
                        suffixIcon: const Icon(Icons.keyboard_arrow_right_outlined),
                      
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _textcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(prefix: const Text('+91',
                      
                      ),
                      label: const Text('phone number',style: TextStyle(fontSize: 15),),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'please enter a valid phone number';
                      }else{
                      return null;
                      }
                    },
                  ),
                   const SizedBox(height: 10,),  
                   TextFormField(
                    obscureText: true,
                    controller: _passwordcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
            
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                      label: const Text('password',),
                     ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                            return 'please enter a password';
                      }else{
                      return null;
                      }
                    },
                   ),
                   const SizedBox(height: 20,),
                   ElevatedButton(onPressed: (){
                    if(_formkey.currentState!.validate()){
                      checkLogin(context);
                    //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeScreen()), (route) => false);
                    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomeScreen(),));
        }else{
          print('Data is Empty');
        }      
        },
   child: const Text('LogIn'),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void checkLogin(BuildContext context)async{
    final username = _textcontroller.text;
    final password = _passwordcontroller.text;
    if(username == '9539515595' && password == 'favas'){
      final sharedpref = await SharedPreferences.getInstance();
      await sharedpref.setBool(save_Key_Value, true);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen(),
      ),
      );
      
    }else{
      // ignore: prefer_const_declarations
      final errorMessage = 'Username password does Not match';
      showDialog(context: context, builder: (context){
         return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text('Close'),
            ),
          ],
         );
      });
    }
  }
}
