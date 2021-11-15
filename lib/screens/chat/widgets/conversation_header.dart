// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ConversationHeader extends StatelessWidget {
  const ConversationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Messages",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.pink[50],
            ),
            child: Row(
              children: const [
                Icon(Icons.add, color: Colors.pink, size: 20),
                SizedBox(width: 2),
                Text(
                  "Add New",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
