import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class TransactionTile extends StatelessWidget {
  final String description;
  final String time;
  final double value;

  const TransactionTile(
      {super.key,
      required this.description,
      required this.time,
      required this.value});

  formatTime(String time) {
    return Jiffy.parse(time).fromNow();
  }

  @override
  Widget build(BuildContext context) {
    final strValue = value > 0 ? "+ ₹ $value" : "- ₹ ${value.abs()}";

    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description, style: const TextStyle(fontSize: 18.0)),
                  Text(
                    formatTime(time),
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Theme.of(context).colorScheme.primary),
                  )
                ]),
            Row(
              children: [
                Text(strValue),
                value > 0
                    ? const Icon(Icons.arrow_upward)
                    : const Icon(Icons.arrow_downward),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
