// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  Tag({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 8.0,
            child: Icon(
              EvaIcons.close,
              size: 12.0,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
