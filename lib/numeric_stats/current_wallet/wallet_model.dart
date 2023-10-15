// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:wault/boxes.dart';

class WalletModel extends ChangeNotifier {
  final _userData = boxUsers.get('key_Alex');
  get totalExpense => _userData.totalExpense;
  get totalIncome => _userData.totalIncome;
  get totalBalance => _userData.totalBalance;
  get transactions => _userData.transactions;

  void update() {
    final userData = boxUsers.get('key_Alex');
    double totalExpense = userData.totalExpense;
    double totalIncome = userData.totalIncome;
    double totalBalance = userData.totalBalance;
    

    notifyListeners();
  }
}
