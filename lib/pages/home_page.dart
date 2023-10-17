import 'package:flutter/material.dart';
import 'package:wault/graphical_stats/graph_container.dart';
import 'package:wault/numeric_stats/summary_section.dart';
import 'package:wault/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const NavBar(
            selectedIndex: 0,
          ),
          const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: SummarySection(),
              )),
          Expanded(
              flex: 2,
              child: Scaffold(
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .inversePrimary
                    .withOpacity(0.3),
                body: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: LineGraphContainer(),
                ),
              )),
        ],
      ),
    );
  }
}
