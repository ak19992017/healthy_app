// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              SizedBox(width: 15),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/userImage1.png'),
                maxRadius: 20,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Kriss Benwat",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Online",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Icon(EvaIcons.settings),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          // MESSAGE LIST SECTION
          SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 10, bottom: 75),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: messages[index].messageType == "receiver" ? 14 : 60,
                    right: messages[index].messageType == "receiver" ? 60 : 14,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].messageType == "receiver"
                                ? Colors.blueAccent
                                : Colors.redAccent),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages[index].messageContent,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Text(
                          DateTime.now().hour.toString() +
                              ":" +
                              DateTime.now().minute.toString().padLeft(2, "0"),
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // BOTTOM TEXT BOX
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              height: 60,
              width: double.infinity,
              child: Row(
                children: <Widget>[
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
                  Icon(EvaIcons.attach),
                  SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Transform.rotate(
                          angle: -pi / 4, child: Icon(Icons.send)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 20))),
                    ),
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
