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
      SalesData(5),
      SalesData(7),
      SalesData(8),
      SalesData(12),
      SalesData(15),
      SalesData(18),
      SalesData(20),
      SalesData(22),
      SalesData(25),
      SalesData(28),
      SalesData(30),
    ];

    return SfCartesianChart(
      primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        minimum: 0, // Valor mínimo do eixo x
        maximum: 30, // Valor máximo do eixo x
        interval: 1, // Intervalo entre os rótulos no eixo x
      ),
      series: <HistogramSeries<SalesData, num>>[
        HistogramSeries<SalesData, num>(
          dataSource: chartData,
          yValueMapper: (SalesData sales, _) => sales.value,
          binInterval: 20, // Isso controla o intervalo dos dados, não o eixo x
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
