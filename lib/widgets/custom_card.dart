// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthy_app/models/to_do.dart';

class CustomCard extends StatelessWidget {
  final ToDo todo;
  const CustomCard({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.red,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        constraints: BoxConstraints.tight(Size.square(200)),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              todo.task,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
