import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Histogram Chart Example')),
      body: Center(child: HistogramChart()),
    ),
  ));
}

class HistogramChart extends StatelessWidget {
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
      series: <HistogramSeries<SalesData, num>>[
        HistogramSeries<SalesData, num>(
          dataSource: chartData,
          yValueMapper: (SalesData sales, _) => sales.value,
          binInterval: 5,
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
