import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';

import 'prime_ui.dart';

class PrimeCalcIsolate extends StatefulWidget {
  const PrimeCalcIsolate({Key? key}) : super(key: key);

  @override
  State<PrimeCalcIsolate> createState() => _PrimeCalcIsolateState();
}

class _PrimeCalcIsolateState extends State<PrimeCalcIsolate> {
  int nth = 0;
  int prime = 0;

  /// Check if number is prime ( slow algorithm )
  static bool isPrime(int n) {
    int count = 0;
    for (int i = 2; i <= n; i++) {
      if (n % i == 0) count++;
    }
    return count == 1;
  }

  static void getNthPrime(SendPort sendPort) async {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    var message = await receivePort.first;

    int n = message[0];
    SendPort replyPort = message[1];

    int primeCount = 0;
    int value = 1;
    while (primeCount < n) {
      value++;
      if (isPrime(value)) primeCount++;
    }
    replyPort.send(value);
  }

  void _setPrime() async {
    nth = Random().nextInt(10000);

    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(getNthPrime, receivePort.sendPort);

    SendPort sendPort = await receivePort.first;
    int num = await sendReceive(sendPort, nth);
    setState(() {
      prime = num;
    });
  }

  Future sendReceive(SendPort send, message) {
    ReceivePort receivePort = ReceivePort();
    send.send([message, receivePort.sendPort]);
    return receivePort.first;
  }

  @override
  Widget build(BuildContext context) {
    return PrimeUI(
      title: 'Isolation',
      n: nth,
      prime: prime,
      setPrime: () => _setPrime(),
    );
  }
}
