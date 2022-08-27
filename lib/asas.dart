import 'package:flutter/material.dart';

class Asas extends StatefulWidget {
  const Asas({Key? key}) : super(key: key);

  @override
  State<Asas> createState() => _AsasState();
}

class _AsasState extends State<Asas> {
  bool checking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
          const Text(
            'Hello, World!!',
          ),
          Checkbox(
              value: checking,
              onChanged: (value) {
                setState(() {
                  checking = value!;
                });
              })
        ]));
  }
}
