// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthy_app/screens/tools/widgets/bookmark_manager.dart';
import 'package:healthy_app/screens/tools/widgets/random_password.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: const [
        Padding(
          padding: EdgeInsets.all(10),
          child: RandomPassword(),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: BookmarkManager(),
        ),
      ],
    );
  }
}
