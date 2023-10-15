import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          // leading: Padding(
          //   padding: const EdgeInsets.only(top: 50),
          //   child: const Image(
          //     height: 25,
          //     width: 25,
          //     image: AssetImage("Wault_logo.png"),
          //   ),
          // ),
          groupAlignment: 0,
          indicatorShape: const CircleBorder(),
          minWidth: 65,
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.home), label: Text('Home')),
            NavigationRailDestination(
                icon: Icon(Icons.credit_card), label: Text('Trasactions')),
            NavigationRailDestination(
                icon: Icon(Icons.leaderboard), label: Text('Leaderboard')),
            NavigationRailDestination(
                icon: Icon(Icons.light_mode), label: Text('Light Mode')),
            NavigationRailDestination(
                icon: Icon(Icons.settings), label: Text('Settings')),
          ],
          selectedIndex: 0,
        ),
        const VerticalDivider(
          thickness: 0.1,
          width: 0.1,
        )
      ],
    );
  }
}
