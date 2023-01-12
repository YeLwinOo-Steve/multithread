import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'prime_ui.dart';

class PrimeCalc extends StatefulWidget {
  const PrimeCalc({Key? key}) : super(key: key);

  @override
  State<PrimeCalc> createState() => _PrimeCalcState();
}

class _PrimeCalcState extends State<PrimeCalc> {
  int prime = 0;
  int nth = 0;

  /// Check if number is prime ( slow algorithm )
  bool isPrime(int n) {
    int count = 0;
    for (int i = 2; i <= n; i++) {
      if (n % i == 0) count++;
    }
    return count == 1;
  }

  /// Get n-th prime number
  int getNthPrime(int n) {
    int primeCount = 0;
    int value = 1;
    while (primeCount < n) {
      value++;
      if (isPrime(value)) primeCount++;
    }
    return value;
  }

  void _setPrime() async {
    nth = Random().nextInt(10000);

    int val = getNthPrime(nth);
    setState(() {
      prime = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PrimeUI(
      title: 'Junk UI',
      n: nth,
      prime: prime,
      setPrime: _setPrime,
    );
  }
}
