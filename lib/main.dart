import 'package:chyoneemarketcap/features/markets/market_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ChyoneeMarketCap',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MarketScreen());
  }
}
