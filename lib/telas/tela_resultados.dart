import 'package:flutter/material.dart';

import '../utils/calculadora.dart';
import '../widgets/cartao_resultado.dart';
import '../widgets/tabela_evolucao.dart';

/// TELA 2: resultados lado a lado.
class TelaResultados extends StatelessWidget {
  final List<double> inv1;
  final List<double> inv2;
  final double investido1; // total que saiu do bolso (capital + aportes)
  final double investido2;

  const TelaResultados({
    super.key,
    required this.inv1,
    required this.inv2,
    required this.investido1,
    required this.investido2,
  });

  @override
  Widget build(BuildContext context) {
    final final1 = inv1.last;
    final final2 = inv2.last;
    final diferenca = (final1 - final2).abs();
    final melhor = final1 >= final2 ? 'Investimento 1' : 'Investimento 2';
    final maior = final1 > final2 ? final1 : final2; // base das barras

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Cartões lado a lado
            Row(
              children: [
                CartaoResultado(
                  titulo: 'Investimento 1',
                  montanteFinal: final1,
                  investido: investido1,
                  cor: Colors.blue,
                ),
                CartaoResultado(
                  titulo: 'Investimento 2',
                  montanteFinal: final2,
                  investido: investido2,
                  cor: Colors.orange,
                ),
              ],
            ),
            Text(
              '$melhor rende ${reais(diferenca)} a mais',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Barras de comparação (proporção em relação ao maior)
            LinearProgressIndicator(
              value: final1 / maior,
              minHeight: 12,
              color: Colors.blue,
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: final2 / maior,
              minHeight: 12,
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            // Tabela mês a mês
            Expanded(
              child: TabelaEvolucao(inv1: inv1, inv2: inv2),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Nova simulação'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
