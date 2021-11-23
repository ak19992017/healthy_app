// ignore_for_file: must_be_immutable

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/models/side_bar_model.dart';
import 'package:healthy_app/widgets/extended_fab.dart';
import 'package:healthy_app/widgets/healthy_logo.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<SideBarModel>();

    return NavigationRail(
      selectedIndex: model.selectdIndex,
      leading: Column(
        children: [
          HealthyLogo(extended: model.extnded),
          const ExtendedFAB(),
        ],
      ),
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(EvaIcons.edit2Outline, color: Colors.red),
          selectedIcon: Icon(EvaIcons.edit2, color: Colors.red),
          label: Text('To Do'),
        ),
        NavigationRailDestination(
          icon: Icon(EvaIcons.messageSquareOutline, color: Colors.green),
          selectedIcon: Icon(EvaIcons.messageSquare, color: Colors.green),
          label: Text('Chats'),
        ),
        NavigationRailDestination(
          icon: Icon(EvaIcons.videoOutline, color: Colors.lightBlue),
          selectedIcon: Icon(EvaIcons.video, color: Colors.lightBlue),
          label: Text('Video Calls'),
        ),
        NavigationRailDestination(
          icon: Icon(EvaIcons.flashOutline, color: Colors.amber),
          selectedIcon: Icon(EvaIcons.flash, color: Colors.amber),
          label: Text('Tools'),
        ),
      ],
      extended: model.extnded,
      // labelType: NavigationRailLabelType.none,
      elevation: 20,
      // groupAlignment: 1,
      trailing: Tooltip(
        message: "Log Out",
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.logout_rounded, color: Colors.red),
        ),
      ),
      // minWidth: 56,
      // minExtendedWidth: 50,
      onDestinationSelected: (index) => model.selectdIndex = index,
      selectedLabelTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}
