import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wault/boxes.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';

bool _isIncome = true;
final _formKey = GlobalKey<FormState>();
final TextEditingController colorController = TextEditingController();

final List<DropdownMenuEntry<Object>> categories = [
  const DropdownMenuEntry(
    value: "Groceries",
    label: "Groceries",
    leadingIcon: Icon(Icons.local_grocery_store),
  ),
  const DropdownMenuEntry(
    value: "Travel",
    label: "Travel",
    leadingIcon: Icon(Icons.flight),
  ),
  const DropdownMenuEntry(
    value: "Rent",
    label: "Rent",
    leadingIcon: Icon(Icons.home),
  ),
  const DropdownMenuEntry(
    value: "Dining",
    label: "Dining",
    leadingIcon: Icon(Icons.dining),
  ),
];

void addTransactionDialogue(context, valueController, descriptionController) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
                content: SizedBox(
                  height: 270,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ChoiceChip(
                            selectedColor:
                                Theme.of(context).colorScheme.secondary,
                            backgroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            label: const Text("Income"),
                            selected: _isIncome,
                            onSelected: (value) {
                              setState(() {
                                _isIncome = !_isIncome;
                              });
                            },
                          ),
                          ChoiceChip(
                            selectedColor:
                                Theme.of(context).colorScheme.secondary,
                            backgroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            label: const Text("Expense"),
                            selected: _isIncome == false,
                            onSelected: (value) {
                              setState(() {
                                _isIncome = !_isIncome;
                              });
                            },
                          ),
                        ],
                      ),
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
                        onSelected: (value) {
                          setState(() {
                            //selectedColor = color;
                          });
                        },
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

                            if (_isIncome) {
                              userData.totalIncome += value;
                              userData.totalBalance += value;
                            } else {
                              userData.totalExpense += value;
                              userData.totalBalance -= value;
                            }

                            userData.transactions.add({
                              "amount":
                                  _isIncome ? value.toString() : "-$value",
                              "time": "${DateTime.now()}",
                              "category": "shopping",
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
