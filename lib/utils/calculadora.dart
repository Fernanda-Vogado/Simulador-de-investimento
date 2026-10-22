// ---------------------------------------------------------------------------
// CÁLCULOS: toda a matemática do app fica aqui, separada da interface.
// ---------------------------------------------------------------------------

/// Juros compostos mês a mês.
/// Retorna uma lista com o saldo no fim de cada mês (índice 0 = mês 1).
/// Fórmula do mês: saldo = saldo * (1 + taxa) + aporte
List<double> calcularEvolucao(
    double capital, double aporte, int meses, double taxaPercentual) {
  final taxa = taxaPercentual / 100; // 1 (%) vira 0.01
  double saldo = capital;
  final lista = <double>[];
  for (int i = 0; i < meses; i++) {
    saldo = saldo * (1 + taxa) + aporte;
    lista.add(saldo);
  }
  return lista;
}

/// Total que saiu do bolso do investidor (capital inicial + todos os aportes).
double totalInvestido(double capital, double aporte, int meses) {
  return capital + aporte * meses;
}

/// Formata um número como dinheiro. Ex.: 1234.5 -> "R$ 1234.50"
String reais(double valor) => 'R\$ ${valor.toStringAsFixed(2)}';
