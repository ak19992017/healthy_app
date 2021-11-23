// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:healthy_app/models/chat_users_model.dart';

class Conversations extends StatefulWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header UI
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Text(
              "Messages",
              style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
            ),
          ),
          // Search bar
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade300,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
              ),
            ),
          ),
          //conversation list view
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: chatUsers.length,
              padding: EdgeInsets.only(top: 20, bottom: 80),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index % 3 == 0) ? true : false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList(
      {Key? key,
      required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead})
      : super(key: key);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {  return ChatDetails();}));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                children: <Widget>[
                  Stack(
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage(widget.imageUrl),
                          maxRadius: 35),
                      if (widget.isMessageRead == false)
                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 6),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
