import 'package:chatapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class CustomChat extends StatelessWidget {
  CustomChat(
      {super.key,
      required this.image,
      required this.name,
      required this.message,
      this.navigation,
      required this.time});

  String image;
  String name;
  String message;
  String time;
  Function? navigation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.withOpacity(0.5),
      )),
      child: 
      GestureDetector(
        onTap: (){
          Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
        
        
        
        },
        child: ListTile(
            
            leading: CircleAvatar(
              backgroundImage: AssetImage(image),
            ),
            title: Text(name),
            subtitle: Text(message),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(time),
              ],
            )),
      ),
    );
  }
}
