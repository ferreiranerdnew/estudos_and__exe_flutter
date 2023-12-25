import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Histogram Chart Example')),
      body: Center(child: _ChartApp()),
    ),
  ));
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulando dados aleatórios para o gráfico de histograma
    final List<SalesData> chartData = [
SalesData(33), 
SalesData(34),
SalesData(34),
SalesData(33),
SalesData(32),
SalesData(33),
SalesData(33),
SalesData(34),
SalesData(34),
SalesData(34),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(34),
SalesData(34),
SalesData(33),
SalesData(33),
SalesData(34),
SalesData(34),
SalesData(34),
SalesData(34),
SalesData(35),
SalesData(35),
SalesData(35),
SalesData(36),
SalesData(36),
SalesData(36),
SalesData(36)
    ];

    return SfCartesianChart(
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
  final int value;

  SalesData(this.value);
}
