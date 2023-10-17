import 'package:flutter/material.dart';
import 'package:wault/pages/home_page.dart';
import 'package:wault/pages/history_page.dart';

class NavBar extends StatefulWidget {
  final int selectedIndex;
  const NavBar({super.key, required this.selectedIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List pages = [
    const HomePage(),
    const TransactionHistory(),
    const Row(children: [
      NavBar(selectedIndex: 2),
      Expanded(
          child: Scaffold(
              body: Center(child: Text("W O R K   I N   P R O G R E S S"))))
    ]),
    const Row(children: [
      NavBar(selectedIndex: 3),
      Expanded(
          child: Scaffold(
              body: Center(child: Text("W O R K   I N   P R O G R E S S"))))
    ]),
    const Row(children: [
      NavBar(selectedIndex: 4),
      Expanded(
          child: Scaffold(
              body: Center(child: Text("W O R K   I N   P R O G R E S S"))))
    ]),
    const Row(children: [
      NavBar(selectedIndex: 5),
      Expanded(
          child: Scaffold(
              body: Center(child: Text("W O R K   I N   P R O G R E S S"))))
    ]),
  ];
  int _selectedIndex = 0;
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
                icon: Icon(Icons.credit_card),
                label: Text('Trasactions'),
              ),
              NavigationRailDestination(
                  icon: Icon(Icons.leaderboard), label: Text('Leaderboard')),
              NavigationRailDestination(
                  icon: Icon(Icons.light_mode), label: Text('Light Mode')),
              NavigationRailDestination(
                  icon: Icon(Icons.settings), label: Text('Settings')),
            ],
            selectedIndex: widget.selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              });
            }),
        const VerticalDivider(
          thickness: 0.1,
          width: 0.1,
        )
      ],
    );
  }
}
