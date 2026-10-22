import 'package:flutter/material.dart';
import '../utils/calculadora.dart';

/// Cartão que mostra o montante final e o rendimento de um investimento.
class CartaoResultado extends StatelessWidget {
  final String titulo;
  final double montanteFinal;
  final double investido; // capital + aportes
  final Color cor;

  const CartaoResultado({
    super.key,
    required this.titulo,
    required this.montanteFinal,
    required this.investido,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    const negrito = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    return Expanded(
      child: Card(
        color: cor.withOpacity(0.15),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Montante final'),
              Text(reais(montanteFinal), style: negrito),
              const SizedBox(height: 6),
              const Text('Rendimento total'),
              Text(reais(montanteFinal - investido), style: negrito),
            ],
          ),
        ),
      ),
    );
  }
}
