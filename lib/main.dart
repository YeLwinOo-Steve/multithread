import 'package:flutter/material.dart';
import 'package:isolation/prime_calc.dart';
import 'package:isolation/prime_ui_choice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Isolation',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const PrimeUIChoice(),
    );
  }
}
