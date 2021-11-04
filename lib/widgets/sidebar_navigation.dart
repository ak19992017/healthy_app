// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/widgets/healthy_logo.dart';

class SideBarNavigation extends StatefulWidget {
  const SideBarNavigation({Key? key}) : super(key: key);

  @override
  _SideBarNavigationState createState() => _SideBarNavigationState();
}

class _SideBarNavigationState extends State<SideBarNavigation> {
  int _selectedIndex = 0;
  bool _extended = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(EvaIcons.gridOutline),
                selectedIcon: Icon(EvaIcons.grid),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(EvaIcons.trendingUpOutline),
                selectedIcon: Icon(EvaIcons.trendingUp),
                label: Text('Trending'),
              ),
              NavigationRailDestination(
                icon: Icon(EvaIcons.musicOutline),
                selectedIcon: Icon(EvaIcons.music),
                label: Text('Music'),
              ),
              NavigationRailDestination(
                icon: Icon(EvaIcons.starOutline),
                selectedIcon: Icon(EvaIcons.star),
                label: Text('Bookmarks'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
            extended: _extended,
            // labelType: NavigationRailLabelType.none,
            elevation: 20,
            // groupAlignment: 1,
            leading: Column(
              children: [
                HealthyLogo(extended: _extended),
                ExtendedFAB(),
              ],
            ),
            trailing: Tooltip(
              message: "Log Out",
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.logout_rounded, color: Colors.red),
              ),
            ),
            // minWidth: 56,
            // minExtendedWidth: 50,
            onDestinationSelected: (int index) => setState(() {
              _selectedIndex = index;
            }),
            selectedLabelTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(child: Text('selectedIndex: $_selectedIndex')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: _extended ? Icon(EvaIcons.arrowLeft) : Icon(EvaIcons.arrowRight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
        onPressed: () => setState(() {
          _extended = !_extended;
        }),
        tooltip: "Toggle",
      ),
    );
  }
}

class ExtendedFAB extends StatelessWidget {
  const ExtendedFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        // The extended fab has a shorter height than the regular fab.
        return Container(
          height: 56,
          padding: EdgeInsets.symmetric(
            vertical: lerpDouble(0, 5, animation.value)!,
          ),
          child: animation.value == 0
              ? FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {},
                )
              : Align(
                  alignment: AlignmentDirectional.centerStart,
                  widthFactor: animation.value,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: FloatingActionButton.extended(
                      icon: const Icon(Icons.add),
                      label: const Text('CREATE'),
                      onPressed: () {},
                    ),
                  ),
                ),
        );
      },
    );
  }
}
