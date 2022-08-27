import 'package:flutter/material.dart';
import 'package:jokenpo/asas.dart';
import 'package:jokenpo/views/jogo.dart';

void main() {
  runApp(const JokenPo());
}

class JokenPo extends StatelessWidget {
  const JokenPo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Asas(),
    );
  }
}
