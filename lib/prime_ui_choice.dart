import 'package:flutter/material.dart';

import 'prime_calc.dart';
import 'prime_calc_isolate.dart';

final amber50 = Colors.amber.shade50;
const amber = Colors.amber;

const padding = EdgeInsets.symmetric(
  horizontal: 40.0,
  vertical: 10.0,
);

class PrimeUIChoice extends StatelessWidget {
  const PrimeUIChoice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prime Number Generator'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrimeCalc(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: amber50,
                padding: padding,
                side: const BorderSide(color: amber),
              ),
              child: const Text('Junk UI'),
            ),
            const SizedBox(height: 30.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrimeCalcIsolate(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: amber50,
                padding: padding,
                side: const BorderSide(color: amber),
              ),
              child: const Text('Isolation'),
            ),
          ],
        ),
      ),
    );
  }
}
