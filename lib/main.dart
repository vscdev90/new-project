import 'package:flutter/material.dart';

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
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Millionaire Mindset'),
      ),
      body: const Center(
        child: Text('Principes komen hier binnenkort.'),
      ),
    );
  }
}
