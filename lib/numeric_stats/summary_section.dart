// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:wault/numeric_stats/transaction_button.dart';
import 'package:wault/numeric_stats/recent_transactions/transaction_log.dart';
import 'package:wault/numeric_stats/current_wallet/wallet.dart';

class SummarySection extends StatefulWidget {
  const SummarySection({super.key});

  @override
  State<SummarySection> createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("W A L L E T"),
        const Wallet(),
        const ExpenseButtons(),
        const Divider(),
        const Text("T R A S A C T I O N S"),
        const SizedBox(
          height: 275,
          child: Center(child: TransactionLog()),
        ),
      ],
    );
  }
}
