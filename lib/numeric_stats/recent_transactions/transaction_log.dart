import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wault/numeric_stats/recent_transactions/transaction_tile.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';

class TransactionLog extends StatefulWidget {
  const TransactionLog({super.key});

  @override
  State<TransactionLog> createState() => _TransactionLogState();
}

class _TransactionLogState extends State<TransactionLog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WalletModel>(
      builder: (context, value, child) => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final transactionData =
                value.transactions.sublist(value.transactions.length - 3);
            return TransactionTile(
              description: transactionData[index]["description"]!,
              time: transactionData[index]["time"]!,
              value: double.parse(transactionData[index]["amount"]!),
            );
          },
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 24,
            );
          },
          itemCount: 3),
    );
  }
}
