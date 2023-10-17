import 'package:flutter/material.dart';

class CategoryStatTile extends StatelessWidget {
  const CategoryStatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Icon(
              Icons.gamepad,
              size: 36,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Text("E N T E R T A I N M E N T"),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.background,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                    child: LinearProgressIndicator(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      value: 0.7,
                      minHeight: 5,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Text("₹ 100"),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
