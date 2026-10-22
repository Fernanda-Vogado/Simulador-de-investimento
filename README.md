# SIMULADOR DE INVESTIMENTOS: COMPARAÇÃO DE RENDIMENTOS


## 1. INTRODUÇÃO E OBJETIVO

Este projeto consiste em um aplicativo desenvolvido em Flutter para a comparação analítica de dois investimentos simultâneos. O sistema processa variáveis como capital inicial, aporte mensal e taxa de juros de cada opção em um período de tempo unificado, exibindo o rendimento comparativo e a evolução do patrimônio mês a mês.

---

## 2. FUNCIONALIDADES DO APLICATIVO

### 2.1 Entrada de Dados e Parâmetros
O formulário inicial solicita três parâmetros fundamentais para cada investimento:
* Capital inicial;
* Aplicação mensal;
* Taxa de juros mensal (%).

O período (em meses) é parametrizado de forma global para garantir a consistência metodológica da comparação.

### 2.2 Processamento e Exibição de Resultados
Após a validação dos dados ao acionar o comando "Simular", a tela de resultados apresenta:
* Cartões Individuais: Montante final e rendimento total para cada modalidade;
* Análise Comparativa: Identificação do investimento de maior rentabilidade com indicação da diferença em moeda nacional ($\text{R}\$ $);
* Representação Visual: Barras indicativas da proporção de ganho entre as opções;
* Evolução Temporal: Lista discriminada do saldo mês a mês.

A navegação conta ainda com as opções "Nova simulação" (retorno ao formulário) e "Limpar" (redefinição dos campos).

---

## 3. PROCEDIMENTO DE EXECUÇÃO

Para a execução do projeto, faz-se necessária a instalação do *framework* Flutter (versão 3.x ou superior). 

Executar os comandos abaixo via terminal:

```bash
git clone <url-do-repositorio>
cd <pasta-do-projeto>
flutter pub get
flutter run
```

*Observação:* Não há dependência de pacotes externos além da biblioteca padrão do Flutter.

---

## 4. METODOLOGIA DE CÁLCULO

O motor de cálculo fundamenta-se na fórmula de juros compostos aplicada de forma iterativa mês a mês:

$$\text{saldo}_{n} = \text{saldo}_{n-1} \times (1 + i) + \text{aporte}$$

Onde:
* $i$ representa a taxa de juros mensal convertida ($\text{taxa} / 100$);
* $\text{aporte}$ representa a aplicação mensal realizada.

O rendimento total é obtido subtraindo-se o total investido (capital inicial + soma dos aportes) do montante acumulado final.

### 4.1 Exemplo Demonstrativo
Considerando um capital inicial de $\text{R}\$ 1.000,00$, aportes mensais de $\text{R}\$ 100,00$ e horizonte de 12 meses:

| Investimento | Taxa Mensal | Mês 1 ($\text{R}\$$) | Mês 2 ($\text{R}\$$) | Montante Final ($\text{R}\$$) | Rendimento Total ($\text{R}\$$) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Investimento 1** | $1,0\%$ | $1.110,00$ | $1.221,10$ | $2.395,08$ | $195,08$ |
| **Investimento 2** | $1,5\%$ | $1.115,00$ | $1.231,72$ | $2.499,74$ | $299,74$ |

*Resultado:* O Investimento 2 apresenta uma rentabilidade superior de $\text{R}\$ 104,66$.

---

## 5. ARQUITETURA DO PROJETO

A estrutura de arquivos localiza-se na pasta `lib/`, organizada conforme o padrão de separação de responsabilidades:

```text
lib/
├── main.dart
├── utils/
│   └── calculadora.dart
├── widgets/
│   ├── campo_numerico.dart
│   ├── cartao_resultado.dart
│   └── tabela_evolucao.dart
└── screens/
    ├── tela_entrada.dart
    └── tela_resultados.dart
```

* **`main.dart`:** Ponto de entrada da aplicação, responsável pela configuração de temas e rotas iniciais.
* **`utils/calculadora.dart`:** Módulo matemático contendo as funções `calcularEvolucao`, `totalInvestido` e `reais` (formatação monetária).
* **`widgets/`:** Componentes reutilizáveis de interface (`CampoNumerico`, `CartaoResultado`, `TabelaEvolucao`).
* **`screens/`:** Interfaces principais da aplicação (`TelaEntrada` e `TelaResultados`).

---

## 6. MAPEAMENTO DOS REQUISITOS DA ATIVIDADE

| Requisito Acadêmico | Componente / Implementação |
| :--- | :--- |
| Formulário para entrada de dados | `tela_entrada.dart` (`Form` e `TextFormField`) |
| Validação de campos | `campo_numerico.dart` |
| Navegação entre páginas | `Navigator.push` e `Navigator.pop` |
| Cálculo de juros compostos | `calculadora.dart` |
| Lista de evolução temporal | `tabela_evolucao.dart` (`ListView.builder`) |
| Exibição lado a lado | `tela_resultados.dart` e `cartao_resultado.dart` |
| Gerenciamento de estado local | `setState` no método `limpar()` em `tela_entrada.dart` |
| Recurso extra: Reiniciar simulação | Botões "Limpar" e "Nova simulação" |
| Recurso extra: Barras comparativas | `LinearProgressIndicator` |
| Código modular e comentado | Presente em todos os módulos |

---

## 7. VALIDAÇÃO DE ENTRADA E TESTES DE SOFTWARE

### 7.1 Regras de Validação
O sistema rejeita entradas vazias ou não numéricas, emitindo o alerta *"Digite um número válido"*. O parser de dados suporta pontuação decimal nos formatos padrão brasileiro (vírgula) e internacional (ponto).

### 7.2 Casos de Teste Executados
1. **Paridade de Valores:** Simulação com parâmetros idênticos gerando resultados proporcionais;
2. **Divergência de Taxas:** Validação do indicador de maior rentabilidade para taxas distintas;
3. **Aportes Nulos:** Cálculo exclusivo sobre o aporte inicial ($\text{aporte} = 0$);
4. **Capital Inicial Nulo:** Cálculo fundamentado unicamente nos aportes recorrentes ($\text{capital} = 0$);
5. **Estresse de Interface:** Teste de rolagem com $120$ períodos mensais;
6. **Tratamento de Exceções:** Inserção de caracteres alfanuméricos e campos nulos.

---

