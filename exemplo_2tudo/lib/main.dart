import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(_ChartApp());

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: SfCartesianChart(
              series: <ChartSeries>[
                HistogramSeries<HistogramData, String>(
                  dataSource: chartData,
                  yValueMapper: (HistogramData sales, _) => sales.frequency,
                  binInterval: 20,
                  showNormalDistributionCurve: true,
                  curveColor: const Color.fromRGBO(192, 108, 132, 1),
                  borderWidth: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HistogramData {
  final String range;
  final int frequency;

  HistogramData(this.range, this.frequency);
}

List<HistogramData> chartData = [
  HistogramData('0-20', 7),
  HistogramData('20-40', 15),
  HistogramData('40-60', 20),
  HistogramData('60-80', 10),
  HistogramData('80-100', 18),
];
