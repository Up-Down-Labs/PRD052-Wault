import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  User({
    required this.name,
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpense,
    required this.transactions,
    required this.expenseLimit,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  double totalBalance;

  @HiveField(2)
  double totalIncome;

  @HiveField(3)
  double totalExpense;

  @HiveField(4)
  List<Map> transactions;

  @HiveField(5)
  double expenseLimit;
}
