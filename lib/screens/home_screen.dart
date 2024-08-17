import 'package:chatapp/common_widgets/chat_widget.dart';
import 'package:chatapp/constants/image_strings.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';

navigation(context){
   Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chats",
            
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          CustomChat(image: profilePic1, 
          name: "Naxient", 
          message: "Your order just arrived!", 
          time: "18:00",
          
          ),
          SizedBox(
            height: 10,
          ),
          CustomChat(image: profilePic2, 
          name: "Hawkins", 
          message: "Your order just arrived!", 
          time: "16:00"),
          
          SizedBox(
            height: 10,
          ),
          CustomChat(image: profilePic3, 
          name: "Leslie Alexander", 
          message: "Your order just arrived!", 
          time: "21:01"),
        ],
      ),
    ));
  }
}
