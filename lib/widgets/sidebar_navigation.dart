import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/widgets/extended_fab.dart';
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
                const ExtendedFAB(),
              ],
            ),
            trailing: Tooltip(
              message: "Log Out",
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded, color: Colors.red),
              ),
            ),
            // minWidth: 56,
            // minExtendedWidth: 50,
            onDestinationSelected: (int index) => setState(() {
              _selectedIndex = index;
            }),
            selectedLabelTextStyle: const TextStyle(
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
        child: _extended
            ? const Icon(EvaIcons.arrowLeft)
            : const Icon(EvaIcons.arrowRight),
        onPressed: () => setState(() {
          _extended = !_extended;
        }),
        tooltip: "Toggle",
      ),
    );
  }
}
