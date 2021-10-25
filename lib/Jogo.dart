// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('images/padrao.png');
  var _menssagem = 'Escolha uma opção abaixo';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //Exibição da imagem escolhida pelo app
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          this._imagemApp = AssetImage('images/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          this._imagemApp = AssetImage('images/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          this._imagemApp = AssetImage('images/tesoura.png');
        });
        break;
    }

    //validação do ganhador
    //usuario ganhador
    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        this._menssagem = 'Parabéns!!! Você ganhou :)';
      });
    }
    //app ganhador
    else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')) {
      setState(() {
        this._menssagem = 'Você perdeu :(';
      });
    } else {
      this._menssagem = 'Empate!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._menssagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
