import 'package:flutter/material.dart';
import 'package:wault/graphical_stats/category_stats.dart';
import 'package:wault/graphical_stats/line_graph.dart';

class LineGraphContainer extends StatelessWidget {
  const LineGraphContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(24)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("B A L A N C E   O V E R V I E W"),
          SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: LineGrpah(),
              )),
          Divider(),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("C A T E G O R Y   O V E R V I E W"),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Center(child: CategoryStats()),
            ),
          ),
        ],
      ),
    );
  }
}
