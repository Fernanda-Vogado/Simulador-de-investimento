import 'package:flutter/material.dart';

import '../utils/calculadora.dart';
import '../widgets/campo_numerico.dart';
import 'tela_resultados.dart';

/// TELA 1: formulário de entrada de dados.
class TelaEntrada extends StatefulWidget {
  const TelaEntrada({super.key});

  @override
  State<TelaEntrada> createState() => _TelaEntradaState();
}

class _TelaEntradaState extends State<TelaEntrada> {
  final _formKey = GlobalKey<FormState>();

  // Controladores: guardam o texto digitado em cada campo
  final capital1 = TextEditingController();
  final aporte1 = TextEditingController();
  final taxa1 = TextEditingController();
  final capital2 = TextEditingController();
  final aporte2 = TextEditingController();
  final taxa2 = TextEditingController();
  final meses = TextEditingController();

  // Converte texto em número (aceita vírgula ou ponto)
  double _num(TextEditingController c) =>
      double.parse(c.text.replaceAll(',', '.'));

  // Valida o formulário, calcula e navega para a tela de resultados
  void simular() {
    if (!_formKey.currentState!.validate()) return;

    final qtdMeses = _num(meses).toInt();
    final inv1 = calcularEvolucao(
      _num(capital1),
      _num(aporte1),
      qtdMeses,
      _num(taxa1),
    );
    final inv2 = calcularEvolucao(
      _num(capital2),
      _num(aporte2),
      qtdMeses,
      _num(taxa2),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TelaResultados(
          inv1: inv1,
          inv2: inv2,
          investido1: totalInvestido(_num(capital1), _num(aporte1), qtdMeses),
          investido2: totalInvestido(_num(capital2), _num(aporte2), qtdMeses),
        ),
      ),
    );
  }

  // Limpa todos os campos
  void limpar() {
    _formKey.currentState!.reset();
    for (final c in [
      capital1,
      aporte1,
      taxa1,
      capital2,
      aporte2,
      taxa2,
      meses,
    ]) {
      c.clear();
    }
    setState(() {}); // atualiza a tela
  }

  // Título de seção
  Widget _titulo(String texto) => Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 8),
    child: Text(
      texto,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simulador de Investimentos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titulo('Investimento 1'),
              CampoNumerico(
                rotulo: 'Capital inicial (R\$)',
                controller: capital1,
              ),
              CampoNumerico(
                rotulo: 'Aplicação mensal (R\$)',
                controller: aporte1,
              ),
              CampoNumerico(
                rotulo: 'Taxa de juros mensal (%)',
                controller: taxa1,
              ),
              _titulo('Investimento 2'),
              CampoNumerico(
                rotulo: 'Capital inicial (R\$)',
                controller: capital2,
              ),
              CampoNumerico(
                rotulo: 'Aplicação mensal (R\$)',
                controller: aporte2,
              ),
              CampoNumerico(
                rotulo: 'Taxa de juros mensal (%)',
                controller: taxa2,
              ),
              _titulo('Período (igual para os dois)'),
              CampoNumerico(rotulo: 'Tempo em meses', controller: meses),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: simular,
                      child: const Text('Simular'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: limpar,
                      child: const Text('Limpar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
