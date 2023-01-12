import 'package:flutter/material.dart';

class PrimeUI extends StatelessWidget {
  const PrimeUI(
      {Key? key,
      required this.title,
      required this.n,
      required this.prime,
      required this.setPrime})
      : super(key: key);
  final String title;
  final int n;
  final int prime;
  final VoidCallback setPrime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$n - th Prime Number is: ',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$prime',
                style: const TextStyle(
                  fontSize: 90,
                  color: Colors.amber,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const CircularProgressIndicator(),
              const LinearProgressIndicator(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setPrime(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
