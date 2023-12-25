import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Histogram Chart Example')),
      body: Center(
          child: Column(
        children: [
          _TopWidget(), // Adiciona o widget separado acima do gráfico
          Expanded(
              child:
                  _ChartApp()), // O gráfico é expandido para preencher o restante do espaço disponível
        ],
      )),
    ),
  ));
}

class _TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulando dados aleatórios
    final List<SalesData> chartData = [
      SalesData(33.82),
      SalesData(34.22),
      SalesData(34.20),
      SalesData(33.63),
      SalesData(32.91),
      SalesData(33.59),
      SalesData(33.44),
      SalesData(34.37),
      SalesData(34.84),
      SalesData(34.23),
      SalesData(35.35),
      SalesData(35.38),
      SalesData(35.01),
      SalesData(35.16),
      SalesData(35.17),
      SalesData(35.27),
      SalesData(35.07),
      SalesData(35.60),
      SalesData(35.23),
      SalesData(35.91),
      SalesData(35.67),
      SalesData(34.91),
      SalesData(34.75),
      SalesData(33.50),
      SalesData(33.42),
      SalesData(34.49),
      SalesData(34.36),
      SalesData(34.08),
      SalesData(34.57),
      SalesData(35.32),
      SalesData(35.40),
      SalesData(35.84),
      SalesData(36.25),
      SalesData(36.38),
      SalesData(36.39),
      SalesData(36.74)
    ];

    // Obtendo o último valor da série
    final double primeiroValor =
        chartData.isNotEmpty ? chartData.first.value : 0.0;
    final double ultimoValor =
        chartData.isNotEmpty ? chartData.last.value : 0.0;
    final double percentual_1 =
        ((ultimoValor - primeiroValor) / primeiroValor) * 100;
    final percentualFormatado =
        percentual_1.toStringAsFixed(2); // Formatando para duas casas decimais

    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Primeiro valor: $primeiroValor',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Último valor: $ultimoValor',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Percentual: $percentualFormatado%',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulando dados aleatórios para o gráfico de histograma
    final List<SalesData> chartData = [
      SalesData(33.82),
      SalesData(34.22),
      SalesData(34.20),
      SalesData(33.63),
      SalesData(32.91),
      SalesData(33.59),
      SalesData(33.44),
      SalesData(34.37),
      SalesData(34.84),
      SalesData(34.23),
      SalesData(35.35),
      SalesData(35.38),
      SalesData(35.01),
      SalesData(35.16),
      SalesData(35.17),
      SalesData(35.27),
      SalesData(35.07),
      SalesData(35.60),
      SalesData(35.23),
      SalesData(35.91),
      SalesData(35.67),
      SalesData(34.91),
      SalesData(34.75),
      SalesData(33.50),
      SalesData(33.42),
      SalesData(34.49),
      SalesData(34.36),
      SalesData(34.08),
      SalesData(34.57),
      SalesData(35.32),
      SalesData(35.40),
      SalesData(35.84),
      SalesData(36.25),
      SalesData(36.38),
      SalesData(36.39),
      SalesData(36.74)
    ];

    return SfCartesianChart(
      // legend: Legend(isVisible: true), // Ativa a legenda e a torna visível
      primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        minimum: 30, // Valor mínimo do eixo x
        maximum: 50, // Valor máximo do eixo x
        interval: 2, // Intervalo entre os rótulos no eixo x
      ),
      series: <HistogramSeries<SalesData, num>>[
        HistogramSeries<SalesData, num>(
          dataSource: chartData,
          yValueMapper: (SalesData sales, _) => sales.value,
          binInterval: 1, // Isso controla o intervalo dos dados, não o eixo x
          showNormalDistributionCurve: true,
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          borderWidth: 3,
          // Mais configurações podem ser adicionadas aqui
        ),
      ],
    );
  }
}

// Classe fictícia para representar os dados de vendas
class SalesData {
  final double value;

  SalesData(this.value);
}
