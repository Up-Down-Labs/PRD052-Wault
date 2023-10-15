import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wault/graphical_stats/category_tile.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';

class CategoryStats extends StatefulWidget {
  const CategoryStats({super.key});

  @override
  State<CategoryStats> createState() => _CategoryStatsState();
}

class _CategoryStatsState extends State<CategoryStats> {
  @override
  Widget build(BuildContext context) => Consumer<WalletModel>(
        builder: (context, value, child) => ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return const CategoryStatTile();
            },
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 24,
              );
            },
            itemCount: 3),
      );
}
