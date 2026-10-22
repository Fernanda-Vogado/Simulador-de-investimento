import 'package:flutter/material.dart';

/// Tabela mês a mês com os dois investimentos lado a lado.
/// Ocupa todo o espaço disponível (use dentro de Column/Expanded).
class TabelaEvolucao extends StatelessWidget {
  final List<double> inv1;
  final List<double> inv2;

  const TabelaEvolucao({super.key, required this.inv1, required this.inv2});

  @override
  Widget build(BuildContext context) {
    const negrito = TextStyle(fontWeight: FontWeight.bold);

    return Column(
      children: [
        // Cabeçalho
        const Row(
          children: [
            Expanded(child: Text('Mês', style: negrito)),
            Expanded(child: Text('Inv. 1 (R\$)', style: negrito)),
            Expanded(child: Text('Inv. 2 (R\$)', style: negrito)),
          ],
        ),
        const Divider(),
        // Linhas (uma por mês)
        Expanded(
          child: ListView.builder(
            itemCount: inv1.length,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Expanded(child: Text('${i + 1}')),
                  Expanded(child: Text(inv1[i].toStringAsFixed(2))),
                  Expanded(child: Text(inv2[i].toStringAsFixed(2))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
