// ignore_for_file: prefer_const_constructors, unused_import

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/models/side_bar_model.dart';
import 'package:healthy_app/screens/chat/chats_page.dart';
import 'package:healthy_app/screens/todos_page.dart';
import 'package:healthy_app/screens/tools/tools_page.dart';
import 'package:healthy_app/screens/video_calls_page.dart';

import 'package:provider/provider.dart';

class DashBoardMobile extends StatefulWidget {
  const DashBoardMobile({Key? key}) : super(key: key);

  @override
  _DashBoardMobileState createState() => _DashBoardMobileState();
}

class _DashBoardMobileState extends State<DashBoardMobile> {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<SideBarModel>();

    return Scaffold(
      body: buildPages(model.selectdIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: model.selectdIndex,
        onTap: (index) => setState(() => model.selectdIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.edit2),
            label: 'To Do',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.messageSquare),
            label: 'Chats',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.video),
            label: 'Video Calls',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.flash),
            label: 'Tools',
            backgroundColor: Colors.amber,
          ),
        ],
        // type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        // iconSize: 40,
        // selectedFontSize: 25,
        unselectedFontSize: 16,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
      ),
    );
  }

  Widget buildPages(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const ToDosPage();
      case 1:
        return const ChatsPage();
      case 2:
        return const VideoCallsPage();
      case 3:
        return const Text("Tools");
      // return const ToolsPage();
      default:
        return const ToDosPage();
    }
  }
}
