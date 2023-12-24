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
  late List<_ChartData> data = [];

  @override
  void initState() {
    super.initState();
    fetchChartData();
    _tooltip = TooltipBehavior(enable: true);
  }

  Future<void> fetchChartData() async {
    final url = Uri.parse(
        'http://192.168.110.178:8120/acoes?acoes=BBDC3.SA,MGLU3.SA&inicio=2022-01-01');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      List<_ChartData> fetchedData = [];

      responseData.forEach((key, value) {
        List<double> parsedValues =
            List<double>.from(value.map((v) => double.parse(v.toString())));
        fetchedData.add(_ChartData(key, parsedValues));
      });

      setState(() {
        data = fetchedData;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: data.isNotEmpty
          ? ListView(
              children: data
                  .map((chartData) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 300,
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              minimum: chartData.y.reduce(min).toDouble(),
                              maximum: chartData.y.reduce(max).toDouble(),
                              interval: 1,
                              labelFormat: '{value}',
                            ),
                            tooltipBehavior: _tooltip,
                            series: <ChartSeries>[
                              BoxAndWhiskerSeries<_ChartData, String>(
                                dataSource: [chartData],
                                xValueMapper: (_ChartData data, _) => data.x,
                                yValueMapper: (_ChartData data, _) => data.y,
                                name: chartData.x,
                                color: Color.fromRGBO(8, 142, 255, 1),
                                dataLabelSettings: DataLabelSettings(
                                  isVisible:
                                      true, //determina se deve aparecer valores no grafico max,min, mediana dentro do box
                                  labelAlignment:
                                      ChartDataLabelAlignment.middle,
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final List<double> y;
}
