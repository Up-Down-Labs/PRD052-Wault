import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WalletModel>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: Theme.of(context).colorScheme.secondary,
        ),
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "B A L A N C E",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Text(
                "₹ ${value.totalBalance.toString()}",
                style: const TextStyle(fontSize: 40.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.arrow_upward),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("I N C O M E",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          Text("₹ ${value.totalIncome.toString()}"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_downward),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "E X P E N S E",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Text("₹ ${value.totalExpense.toString()}"),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
