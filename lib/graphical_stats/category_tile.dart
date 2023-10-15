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
    );
  }
}
