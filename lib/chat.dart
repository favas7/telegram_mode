import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
 final int index;

   ChatPage({super.key,required this.index});
 

 // ignore: unused_field
 final TextEditingController _messageController=TextEditingController();

  @override
  Widget build(BuildContext context) {
   // var index;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 101, 173),
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back_outlined),
             onPressed: () {
              Navigator.pop(context);
             },

             ),

            
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(images[index])
                ),
                const SizedBox(width: 8),
                 Text(title[index]),
                ],
            ),
            actions: const [ Icon(Icons.more_vert)],
            ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
               padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              height: 50,
              color: Colors.blue,
              child: const Row(
                children: [
                  Icon(Icons.menu),
                  Text('Menu'),
                   SizedBox(width: 10),
                   Expanded(child: TextField(

                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: InputBorder.none,
                    ),
                   
                   ),
                  
                   ),
                   Icon(Icons.attachment_rounded),
                   Padding(padding: EdgeInsets.only(right: 10)),
                Icon(Icons.mic),
                Padding(padding: EdgeInsets.only(right: 20))
                ],
              )
            )
            
          ],
          
        ),   
            
      );
  }
}