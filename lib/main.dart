import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wault/boxes.dart';
import 'package:wault/database/user.dart';
import 'package:wault/home_page.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';

const textColor = Color(0xFFffffff);
const backgroundColor = Color(0xFF121212);
const primaryColor = Color(0xFFc9d2d9);
const primaryFgColor = Color(0xFF262626);
const secondaryColor = Color(0xFF2e577a);
const secondaryFgColor = Color(0xFFffffff);
const accentColor = Color(0xFF79bcf6);
const accentFgColor = Color(0xFF262626);

const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  background: backgroundColor,
  onBackground: textColor,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  boxUsers = await Hive.openBox<User>('userBox');

  boxUsers.put(
      'key_Alex',
      User(
          name: 'Alex',
          expenseLimit: 6000,
          totalBalance: 2800,
          totalExpense: 2200,
          totalIncome: 5000,
          transactions: [
            {
              "description": "Travel",
              "time": "2023-10-01 13:27:00.000",
              "amount": "-700",
              "balance": "4300"
            },
            {
              "description": "Amazon",
              "time": "2023-10-05 13:27:00.000",
              "amount": "-1000",
              "balance": "3300"
            },
            {
              "description": "Restaurent",
              "time": "2023-10-10 13:27:00.000",
              "amount": "-500",
              "balance": "2800"
            },
          ]));

  runApp(ChangeNotifierProvider(
    create: (context) => WalletModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wault',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}



/*

// Dark Colors


const textColor = Color(0xFFffffff);
const backgroundColor = Color(0xFF262626);
const primaryColor = Color(0xFFc9d2d9);
const primaryFgColor = Color(0xFF262626);
const secondaryColor = Color(0xFF2e577a);
const secondaryFgColor = Color(0xFFffffff);
const accentColor = Color(0xFF79bcf6);
const accentFgColor = Color(0xFF262626);
  
const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  background: backgroundColor,
  onBackground: textColor,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.dark == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);
*/

/*

// Light Colors

const textColor = Color(0xFF000000);
const backgroundColor = Color(0xFFededed);
const primaryColor = Color(0xFF262f36);
const primaryFgColor = Color(0xFFededed);
const secondaryColor = Color(0xFF85add1);
const secondaryFgColor = Color(0xFF000000);
const accentColor = Color(0xFF094c86);
const accentFgColor = Color(0xFFededed);
  
const colorScheme = ColorScheme(
  brightness: Brightness.light,
  background: backgroundColor,
  onBackground: textColor,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);

*/