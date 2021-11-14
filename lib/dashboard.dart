// ignore_for_file: prefer_const_constructors

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/models/side_bar_model.dart';
import 'package:healthy_app/screens/chats_page.dart';
import 'package:healthy_app/screens/settings_page.dart';
import 'package:healthy_app/screens/todos_page.dart';
import 'package:healthy_app/screens/tools_page.dart';
import 'package:healthy_app/screens/video_calls_page.dart';
import 'package:healthy_app/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<SideBarModel>();
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: buildPages(model.selectdIndex))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: model.extnded
            ? const Icon(EvaIcons.arrowLeft)
            : const Icon(EvaIcons.arrowRight),
        onPressed: () => model.extnded = !model.extnded,
        tooltip: "Toggle",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
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
        return const ToolsPage();
      case 4:
        return const SettingsPage();
      default:
        return const ToDosPage();
    }
  }
}
