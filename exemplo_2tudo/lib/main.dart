import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';

void main() {
  runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late TooltipBehavior _tooltip;
  late List<ChartData1> histogramData = [];

  @override
  void initState() {
    super.initState();
    fetchChartData();
    _tooltip = TooltipBehavior(enable: true);
  }

  Future<void> fetchChartData() async {
    // final url = Uri.parse(
    //     'http://192.168.110.178:8120/acoes?acoes=BBDC3.SA&inicio=2022-01-01');
    final url = Uri.parse(
        'http://191.252.200.156:81/acoesboxplot?usuario=appFNB3&senha=SOSlgQOQqlYMXA((i1U2E3909875367****jhbdfb&acoes=PETR4&inicio=2023-11-01');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      List<ChartData1> fetchedData = [];

      // responseData.forEach((key, value) {
      //   List<double> parsedValues =
      //       List<double>.from(value.map((v) => double.parse(v.toString())));
      //   fetchedData.add(ChartData1(key, parsedValues));
      // });
      responseData.forEach((key, value) {
        value.forEach((v) {
          histogramData.add(ChartData1(v));
        });
      });

      // setState(() {
      //   histogramData = fetchedData;
      // });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
      final Map<String, int> intervalFrequencies = {};

    for (final data in histogramData) {
      final interval = (data.value ~/ 10) * 10; // Calcula o intervalo
      final intervalKey = '$interval-${interval + 10}';

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
// class ChartData1 {
//   ChartData1(this.value);

//   final String x;
//   final List<double> y;
// }

class HistogramData {
  final String range;
  final int frequency;

  HistogramData(this.range, this.frequency);
}
