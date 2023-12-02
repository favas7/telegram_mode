import 'package:flutter/material.dart';
import 'package:flutter_application_3/chat.dart';
import 'package:flutter_application_3/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: non_constant_identifier_names
List<String> title=[
"Nikki",
"Anime AI",
"DevTown Bootcamps",
"Flipkart Loots Deals",
"Students KTU",
"Marvel Fans India",
"Sarcasm",
"Trixie Bot",
"Marvel",
"iPopkornBot",
"Crypto Whale Hunters",
"Riya",
];

List<String> subtitile=[
  "food ksyichit vilikk ttoo...",
  "Started processing... This might take a while",
  "J pinned Deleted message",
  "TENNIS & FOOTBALL Lovers Ke Li..",
  " Rajath:hi",
   "Marvel Fans India : God Of Stories",
   "@sarcasm9",
   "Sardhar 2022 tamil 1440p 10Bit",
   "Cillian Murphy is Marvel's top choice to play Doctor Doom in the MCU",
   "insidious",
   "Binance Futures, KuCoin Futures, OKX Futures",
   "Time kalenda, poyi irnn padicho",
];
List<String> time=[
  '1:43PM',
  '7:26PM',
  '7:16PM',
  '7:01PM',
  '6:58PM',
  '6:55PM',
  '6:51PM',
  '6:48PM',
  '6:45PM',
  '6:43PM',
  '5:51PM',
  '4:51PM',
];

List<String> images= [
  "asset/images/nikki.jpeg",
  "asset/images/animeai.jpg",
  "asset/images/devtown.jpg",
  "asset/images/flip.jpg",
  "asset/images/ktu.jpg",
  "asset/images/marvel-india.jpg",
  "asset/images/sarcasm.jpg",
  "asset/images/trixie.jpg",
  "asset/images/marvel.jpg",
  "asset/images/ipop.jpg",
  "asset/images/cripto.jpg",
  "asset/images/HG.jpg",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Telegram'),
        actions: [
          const Icon(Icons.search),
          IconButton(icon: const Icon(Icons.logout_outlined),
            onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: const Text('sign out'),
                content: const Text('Are You sure you want to sign out?'),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                   child: const Text('Cancel')
                   ),
                  
                   TextButton(onPressed: (){
                    signout(context);
                    Navigator.of(context).pop();
                   }, child: const Text('Signout'),
                   ),
                ],
              );
            });
          },  )
        
      
        
        
          
        ],

        
     elevation: 0,
      ),
      body: Column(
      children: [
      
      Expanded(
      child:   ListView.separated(
        itemBuilder: (
          context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (context)=>ChatPage(index: index,)
                )
                );
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                images[index])
                ),
          title: Text(title[index]),
          subtitle: Text(subtitile[index]),
          trailing: Text(time[index]),
          ),
        );
      },
       separatorBuilder:(context, index) =>const Divider(height: 3), itemCount: 12),
      ),
      ],
      )
    );

  }
  signout(BuildContext context)async{
     final sharedpref = await SharedPreferences.getInstance();
     await sharedpref.clear();
     // ignore: use_build_context_synchronously
     Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context)=>const ScreenLogin()),
         (route) => false);
  }
}