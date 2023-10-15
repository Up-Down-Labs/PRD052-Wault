import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';
import 'package:wault/numeric_stats/transaction_dialogue.dart';

class ExpenseButtons extends StatefulWidget {
  const ExpenseButtons({super.key});

  @override
  State<ExpenseButtons> createState() => _ExpenseButtonsState();
}

class _ExpenseButtonsState extends State<ExpenseButtons> {
  late TextEditingController valueController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    valueController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    valueController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletModel>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
              icon: const Icon(Icons.credit_card),
              onPressed: () async {
                addTransactionDialogue(
                    context, valueController, descriptionController);
              },
              label: const Text("A D D  T R A N S A C T I O N")),
        ],
      ),
    );
  }
}
