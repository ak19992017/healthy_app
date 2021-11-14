// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthy_app/models/chat_message_model.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({Key? key}) : super(key: key);

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/userImage1.png'),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Kriss Benwat",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          // MESSAGE LIST SECTION
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.blue.shade400
                          : Colors.red.shade400),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
          // BOTTOM TEXT BOX
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 0),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.send, color: Colors.white, size: 18),
                    backgroundColor: Colors.black,
                    elevation: 0,
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
