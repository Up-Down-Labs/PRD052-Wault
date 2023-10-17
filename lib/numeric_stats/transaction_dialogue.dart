import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wault/boxes.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';

final _formKey = GlobalKey<FormState>();
final TextEditingController colorController = TextEditingController();

enum Categories { allowance, dining, entertainment, groceries, travel }

final List<DropdownMenuEntry<Object>> categories = [
  const DropdownMenuEntry(
    value: Categories.allowance,
    label: "Allowance",
    leadingIcon: Icon(Icons.money),
  ),
  const DropdownMenuEntry(
    value: Categories.dining,
    label: "Dining",
    leadingIcon: Icon(Icons.dining),
  ),
  const DropdownMenuEntry(
    value: Categories.entertainment,
    label: "Entertainment",
    leadingIcon: Icon(Icons.gamepad),
  ),
  const DropdownMenuEntry(
    value: Categories.groceries,
    label: "Groceries",
    leadingIcon: Icon(Icons.local_grocery_store),
  ),
  const DropdownMenuEntry(
    value: Categories.travel,
    label: "Transport",
    leadingIcon: Icon(Icons.subway),
  ),
];

enum TransactionType { income, expense }

void addTransactionDialogue(context, valueController, descriptionController) {
  TransactionType choice = TransactionType.income;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: AlertDialog(
                content: SizedBox(
                  height: 270,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SegmentedButton<TransactionType>(
                          segments: const <ButtonSegment<TransactionType>>[
                            ButtonSegment(
                                value: TransactionType.income,
                                label: Text('Income'),
                                icon: Icon(Icons.arrow_upward)),
                            ButtonSegment(
                                value: TransactionType.expense,
                                label: Text('Expense'),
                                icon: Icon(Icons.arrow_downward)),
                          ],
                          selected: <TransactionType>{
                            choice
                          },
                          onSelectionChanged:
                              (Set<TransactionType> newSelection) {
                            setState(() {
                              choice = newSelection.first;
                            });
                          }),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                double.tryParse(value) == null) {
                              return 'Enter an Amount';
                            }
                            return null;
                          },
                          controller: valueController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Amount',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownMenu(
                        //initialSelection: ColorLabel.green,
                        controller: colorController,
                        label: const Text('Categories'),
                        dropdownMenuEntries: categories,
                        onSelected: (value) {},
                      )
                    ],
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: const Text("C A N C E L"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text("S U B M I T"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final userData = boxUsers.get('key_Alex');

                            final value = double.parse(valueController.text);

                            if (choice == TransactionType.income) {
                              userData.totalIncome += value;
                              userData.totalBalance += value;
                            } else {
                              userData.totalExpense += value;
                              userData.totalBalance -= value;
                            }

                            userData.transactions.add({
                              "amount": choice == TransactionType.income
                                  ? value.toString()
                                  : "-$value",
                              "time": "${DateTime.now()}",
                              "category": "Shopping",
                              "description": descriptionController.text,
                              "balance": userData.totalBalance.toString()
                            });

                            boxUsers.put('key_Alex', userData);

                            Navigator.of(context).pop();
                            if (context.mounted) {
                              context.read<WalletModel>().update();
                            }
                          }
                        },
                      ),
                    ],
                  )
                ]),
          );
        });
      });
}
