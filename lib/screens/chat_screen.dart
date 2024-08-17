import 'package:chatapp/common_widgets/chat_widget.dart';
import 'package:chatapp/constants/image_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/chat_message.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getMessages() {
    return firestore
        .collection("msgs")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  void addMsg() {
    if (msgController.text.isNotEmpty) {
      firestore
          .collection("msgs")
          .add({
            "msg": msgController.text,
            "timestamp": FieldValue.serverTimestamp(), // Add a timestamp field
          })
          .then((value) => print("Message Added"))
          .catchError((e) {
            print("Error adding message: $e");
          });
      msgController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Chats",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(profilePic1),
                      ),
                      title: const Text("Naxient"),
                      subtitle: const Text("Online"),
                      trailing: CircleAvatar(
                        radius: 20,
                        backgroundColor:
                            const Color(0xffEC2578).withOpacity(0.1),
                        child: const Icon(
                          Icons.call,
                          color: Color(0xffEC2578),
                        ),
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: getMessages(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        } else if (!snapshot.hasData ||
                            snapshot.data.docs.isEmpty) {
                          return const Center(child: Text("No messages yet."));
                        } else {
                          return SizedBox(
                            height: 400, // Limit the height
                            child: ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                var msg = snapshot.data.docs[index];
                                // Customize based on your logic
                                return ChatMessage(
                                  message: msg["msg"],
                                  isSentByMe: true,
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: msgController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Send a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Color(0xffEC2578),
                          ),
                          onPressed: addMsg,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
