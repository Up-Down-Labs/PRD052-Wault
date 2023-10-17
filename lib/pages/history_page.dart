import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wault/nav_bar.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';
import 'package:wault/numeric_stats/recent_transactions/transaction_tile.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavBar(
            selectedIndex: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text("T R A N S A C T I O N   H I S T O R Y"),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Consumer<WalletModel>(
                      builder: (context, value, child) => ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return TransactionTile(
                              description: value.transactions[index]
                                  ["description"]!,
                              time: value.transactions[index]["time"]!,
                              value: double.parse(
                                  value.transactions[index]["amount"]!),
                            );
                          },
                          reverse: true,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(24),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 24,
                            );
                          },
                          itemCount: value.transactions.length),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
