// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:jokenpo/widgets/image_widget.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imageApp = ValueNotifier<String?>('padrao');
  List<String> imgs = ['pedra', 'papel', 'tesoura'];
  var status = ValueNotifier('Vamor jogar?');
  var jogada = ValueNotifier<String?>(null);
  var corWinLose = ValueNotifier<Color>(Colors.amber);

  void startJogo(String imgUser) {
    int indexList = Random().nextInt(3);
    imageApp.value = imgs[indexList];

    if (imgUser == imgs[indexList]) {
      status.value = 'Empatamos';
      corWinLose.value = Colors.black;
    } else if ((imgUser == 'pedra' && imgs[indexList] == 'tesoura') ||
        (imgUser == 'tesoura' && imgs[indexList] == 'papel') ||
        (imgUser == 'papel' && imgs[indexList] == 'pedra')) {
      status.value = 'Voçê Ganhou';
      corWinLose.value = Colors.green;
    } else {
      status.value = 'Ganhei';
      corWinLose.value = Colors.red;
    }
    jogada.value = 'App: ${imageApp.value} x Usuário: $imgUser'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPô'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Escolha do App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              ValueListenableBuilder<String?>(
                  valueListenable: imageApp,
                  builder: (_, value, __) => ImageWidget(
                        imageFundo: 'assets/images/$value.png',
                      )),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ValueListenableBuilder(
                    valueListenable: status,
                    builder: (_, value, __) {
                      var corTXT = corWinLose.value;
                      return Text(
                        "Status: $value",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: corTXT),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ImageWidget(
                          aoClicar: () {
                            startJogo('pedra');
                          },
                          imageFundo: 'assets/images/pedra.png'),
                      ImageWidget(
                          aoClicar: () {
                            startJogo('papel');
                          },
                          imageFundo: 'assets/images/papel.png'),
                      ImageWidget(
                          aoClicar: () {
                            startJogo('tesoura');
                          },
                          imageFundo: 'assets/images/tesoura.png'),
                    ],
                  ),
                ),
              ),
              ValueListenableBuilder<String?>(
                  valueListenable: jogada,
                  builder: (_, value, __) => Text(value ?? '-'))
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Created by: JB Silva',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
