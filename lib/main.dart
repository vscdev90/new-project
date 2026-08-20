import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MillionaireMindsetApp());
}

class MillionaireMindsetApp extends StatelessWidget {
  const MillionaireMindsetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Millionaire Mindset',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
