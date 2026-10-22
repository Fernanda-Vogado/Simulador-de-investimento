import 'package:flutter/material.dart';

import 'telas/tela_entrada.dart';

// Ponto de entrada do app: só inicia o aplicativo.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador de Investimentos',
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: const TelaEntrada(), // primeira tela
    );
  }
}
