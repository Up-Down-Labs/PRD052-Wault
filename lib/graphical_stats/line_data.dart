import 'package:fl_chart/fl_chart.dart';
import 'package:wault/boxes.dart';

class LineData {
  static getTitleData() {
    final userData = boxUsers.get('key_Alex');
    var transactions = userData.transactions;

    List<FlSpot> plots = [];

    plots.add(FlSpot((DateTime.parse(transactions[0]['time']).day.toDouble()),
        double.parse(transactions[0]['balance'])));

    var tempDate = DateTime.parse(transactions[0]['time']).day;

    transactions =
        transactions.sublist(transactions.length - (transactions.length - 1));

    for (var transaction in transactions) {
      if (tempDate == DateTime.parse(transaction['time']).day) {
        plots.removeLast();
      }

      plots.add(FlSpot(
          (DateTime.parse(transaction['time']).day.toDouble()),
          double.parse(transaction['balance']) > 0
              ? double.parse(transaction['balance'])
              : 0));

      tempDate = DateTime.parse(transaction['time']).day;
    }

    if (tempDate == DateTime.now().day) {
      plots.removeLast();
    }

    plots.add(FlSpot(DateTime.now().day.toDouble(),
        userData.totalBalance > 0 ? userData.totalBalance : 0));

    return plots;
  }

  static getMaxY() {
    final userData = boxUsers.get('key_Alex');
    var transactions = userData.transactions;

    var tempDate = DateTime.parse(transactions[0]['time']).day;
    var amountList = [];

    amountList.add(double.parse(transactions[0]['balance']));

    transactions =
        transactions.sublist(transactions.length - (transactions.length - 1));

    for (var transaction in transactions) {
      if (tempDate == DateTime.parse(transaction['time']).day) {
        amountList.removeLast();
      }
      amountList.add(double.parse(transaction['balance']));
      tempDate = DateTime.parse(transaction['time']).day;
    }

    final maxTransaction =
        amountList.reduce((curr, next) => curr > next ? curr : next);

    switch (maxTransaction) {
      case <= 100:
        return ((maxTransaction ~/ 50) + 1) * 50;
      case <= 1000:
        return ((maxTransaction ~/ 1000) + 1) * 1000;
      case <= 5000:
        return ((maxTransaction ~/ 2500) + 1) * 2500;
      case <= 25000:
        return ((maxTransaction ~/ 5000) + 1) * 5000;
      default:
        return ((maxTransaction ~/ 25000) + 1) * 25000;
    }
  }

  static getInterval() {
    var maxY = getMaxY();
    switch (maxY) {
      case <= 100:
        return 10;
      case <= 1000:
        return 100;
      case <= 10000:
        return 1000;
      case <= 100000:
        return 10000;
      case <= 300000:
        return 25000;
      case <= 500000:
        return 50000;
      case <= 1000000:
        return 100000;
      default:
        return 1000000;
    }
  }
}
