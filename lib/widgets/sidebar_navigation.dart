// ignore_for_file: must_be_immutable

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/models/side_bar_nav_model.dart';
import 'package:healthy_app/widgets/extended_fab.dart';
import 'package:healthy_app/widgets/healthy_logo.dart';
import 'package:provider/provider.dart';

class SideBarNavigation extends StatelessWidget {
  const SideBarNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<SideBarNavModel>();

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
          icon: Icon(EvaIcons.gridOutline),
          selectedIcon: Icon(EvaIcons.grid),
          label: Text('To Do'),
        ),
        NavigationRailDestination(
          icon: Icon(EvaIcons.starOutline),
          selectedIcon: Icon(EvaIcons.star),
          label: Text('Favourites'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: Text('Settings'),
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
