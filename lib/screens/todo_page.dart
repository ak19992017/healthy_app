// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:healthy_app/widgets/custom_card.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Wrap(
        children: [
          CustomCard(
            title: "Today's task",
            description: "Noting much too do today",
          ),
          CustomCard(
            title: "Today's task",
            description: "Noting much to do today",
          ),
          CustomCard(
            title: "Today's task",
            description: "Noting much tooooooooooo do today",
          ),
          CustomCard(
            title: "Today's task",
            description: "Noting much to do today",
          ),
          CustomCard(
            title: "Today's task",
            description: "Noting much tooooooooooo do today",
          ),
        ],
      ),
    );
  }
}
