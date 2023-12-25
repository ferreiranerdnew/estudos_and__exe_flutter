import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(_ChartApp());

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartData1> histogramData = <ChartData1>[
      ChartData1(33.82),
      ChartData1(34.22),
      ChartData1(34.20),
      ChartData1(33.63),
      ChartData1(32.91),
      ChartData1(33.59),
      ChartData1(33.44),
      ChartData1(34.37),
      ChartData1(34.84),
      ChartData1(34.23),
      ChartData1(35.35),
      ChartData1(35.38),
      ChartData1(35.01),
      ChartData1(35.16),
      ChartData1(35.17),
      ChartData1(35.27),
      ChartData1(35.07),
      ChartData1(35.60),
      ChartData1(35.23),
      ChartData1(35.91),
      ChartData1(35.67),
      ChartData1(34.91),
      ChartData1(34.75),
      ChartData1(33.50),
      ChartData1(33.42),
      ChartData1(34.49),
      ChartData1(34.36),
      ChartData1(34.08),
      ChartData1(34.57),
      ChartData1(35.32),
      ChartData1(35.40),
      ChartData1(35.84),
      ChartData1(36.25),
      ChartData1(36.38),
      ChartData1(36.39),
      ChartData1(36.74)
    ];

    final Map<String, int> intervalFrequencies = {};

    for (final data in histogramData) {
      final interval = (data.value ~/ 0.50) * 0.50; // Calcula o intervalo
      final intervalKey = '$interval-${interval + 0.50}';

      if (intervalFrequencies.containsKey(intervalKey)) {
        intervalFrequencies[intervalKey] =
            intervalFrequencies[intervalKey]! + 1;
      } else {
        intervalFrequencies[intervalKey] = 1;
      }
    }

    final List<HistogramData> processedData =
        intervalFrequencies.entries.map((entry) {
      return HistogramData(entry.key, entry.value);
    }).toList();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: SfCartesianChart(
              series: <ChartSeries>[
                HistogramSeries<HistogramData, String>(
                  dataSource: processedData,
                  showNormalDistributionCurve: true,
                  curveColor: const Color.fromRGBO(192, 108, 132, 1),
                  binInterval: 10, // Intervalo de 10 para os dados
                  // fieldName: 'range', // Mapeamento do eixo x
                  yValueMapper: (HistogramData data, _) =>
                      data.frequency.toDouble(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData1 {
  final double value;

  ChartData1(this.value);
}

class HistogramData {
  final String range;
  final int frequency;

  HistogramData(this.range, this.frequency);
}
