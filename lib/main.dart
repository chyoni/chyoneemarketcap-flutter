import 'package:chyoneemarketcap/features/navigation/navigation_screen.dart';
import 'package:chyoneemarketcap/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<dynamic> a = ApiService.getAllCoins();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChyoneeMarketCap',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF3961FB),
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelColor: Colors.grey.shade500,
        ),
      ),
      home: const NavigationScreen(),
    );
  }
}
