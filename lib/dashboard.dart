// ignore_for_file: prefer_const_constructors

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/models/side_bar_nav_model.dart';
import 'package:healthy_app/screens/favourites_page.dart';
import 'package:healthy_app/screens/settings_page.dart';
import 'package:healthy_app/screens/todo_page.dart';
import 'package:healthy_app/widgets/sidebar_navigation.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<SideBarNavModel>();
    return Scaffold(
      body: Row(
        children: [
          SideBarNavigation(),
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
    );
  }

  Widget buildPages(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const ToDoPage();
      case 1:
        return const FavouritesPage();
      case 2:
        return const SettingsPage();
      default:
        return const ToDoPage();
    }
  }
}
