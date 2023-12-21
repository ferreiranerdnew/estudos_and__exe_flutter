import 'package:analise_acoes/pages/analise_acoes_page.dart';
import 'package:analise_acoes/wigets/analise_acoes_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:analise_acoes/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class SceneMedia extends StatefulWidget {
  final String todoTitle;

  SceneMedia({required this.todoTitle});
  @override
  _SceneMediaState createState() => _SceneMediaState();
}

class _SceneMediaState extends State<SceneMedia> {
  late List<_ChartData> data = [];
  late TextEditingController _dataController;
  late DateTime initialDate;

  @override
  void initState() {
    super.initState();
    _dataController = TextEditingController();
    initialDate = DateTime.now().subtract(Duration(days: 60));

    String initialFormattedDate =
        "${initialDate.year}-${initialDate.month.toString().padLeft(2, '0')}-${initialDate.day.toString().padLeft(2, '0')}";

    _dataController.text = initialFormattedDate;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.todoTitle);
    const myTextColor = Color(0xff575f61);
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Container(
          // padding: EdgeInsets.fromLTRB(0, 50.137 * fem, 0, 0.793 * fem),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // logofnb3comborda01ok5cb3 (61:11)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 21 * fem),
                width: 365 * fem,
                height: 46 * fem,
                child: Image.asset(
                  'assets/page-1/images/logofnb3comborda.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 50, // Defina a altura desejada aqui
                alignment: Alignment.center, // Centraliza o conteúdo
                child: Text(
                  'Análise média',
                  style: SafeGoogleFont(
                    'Irish Grover',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.21 * ffem / fem,
                    color: myTextColor,
                  ),
                ),
              ),

              Container(
                margin:
                    EdgeInsets.fromLTRB(9 * fem, 0 * fem, 17 * fem, 16 * fem),
                width: double.infinity,
                height: 68 * fem,
                decoration: BoxDecoration(
                  color:const Color(0xffdbebeb),
                  borderRadius: BorderRadius.circular(36 * fem),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20), // Espaçamento horizontal para o texto
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget
                          .todoTitle, // Exibe o texto vindo da variável todoTitle
                      textAlign: TextAlign.left, // Alinha o texto à esquerda
                      style: TextStyle(
                        fontFamily: 'Irish Grover',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.208984375 * ffem / fem,
                        color: myTextColor,
                      ),
                    ),
                  ),
                ),
              ),

              // BUG escolhendo a data
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(DateTime.now().year - 10),
                    lastDate: DateTime(DateTime.now().year + 10),
                    // locale: const Locale('pt', 'BR'),
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                    _dataController.text = formattedDate;
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffdbebeb)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36 * fem),
                    ),
                  ),
                ),
                child: Container(
                  height: 68 * fem,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _dataController,
                    decoration: InputDecoration(
                      hintText: 'Data Início da Análise',
                      hintStyle: TextStyle(
                        fontFamily: 'Irish Grover',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.208984375 * ffem / fem,
                        color: myTextColor,
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(
                      fontFamily: 'Irish Grover',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.208984375 * ffem / fem,
                      color: myTextColor,
                    ),
                    readOnly: true,
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: DateTime(DateTime.now().year - 5),
                        lastDate: DateTime(DateTime.now().year + 10),
                        // locale: const Locale('pt', 'BR'),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                        _dataController.text = formattedDate;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaço entre os botões
              SizedBox(
                height: 68,
                width: 500,
                child: ElevatedButton(
                  onPressed: () async {
                    // Adicione aqui o código a ser executado ao pressionar o botão
                    String acoes = widget.todoTitle;
                    String inicio = _dataController.text;
                    if (inicio.isEmpty) {
                      // Adicione alguma lógica aqui se o campo de data estiver vazio
                      return;
                    }
                    final url = Uri.parse(
                        'http://191.252.200.156:81/acoesboxplot?usuario=appFNB3&senha=SOSlgQOQqlYMXA((i1U2E3909875367****jhbdfb&acoes=$acoes&inicio=$inicio');

                    try {
                      final response = await http.get(url);
                      print(response.statusCode);

                      if (response.statusCode == 200) {
                        final responseData = json.decode(response.body);
                        print(responseData);

                        // Navegue para a próxima página passando os dados brutos
                        showChartModal(context, responseData);
                      } else {
                        // Trate os casos onde a resposta não é bem-sucedida
                      }
                    } catch (e) {
                      // Trate os erros que possam ocorrer durante a requisição
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36 * fem),
                    ),
                    backgroundColor: Color(0xff5bc2c9),
                  ),
                  child: Text(
                    'Analisar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Irish Grover',
                      fontSize: 32 * ffem,
                      fontWeight: FontWeight.w400,
                      // height: 0.21 * ffem / fem,
                      color: Color(0xffebf5f6),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 200),
              // RF rodapé da pagina buttom retorno
              // InkWell(
              //   onTap: () {
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => TodoListPage(),
              //       ),
              //     );
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
              //     width: 65,
              //     height: 53,
              //     child: Center(
              //       child: Container(
              //         width: 53,
              //         height: 53,
              //         child: Image.asset(
              //           'assets/page-1/images/iconhomeazul-1.png',
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

// RF inicio configuração do modal onde é apresentado o gráfico
  void showChartModal(BuildContext context, dynamic responseData) {
    List<_ChartData> fetchedData = [];

    if (responseData.isNotEmpty) {
      responseData.forEach((key, value) {
        List<double> parsedValues =
            List<double>.from(value.map((v) => double.parse(v.toString())));
        fetchedData.add(_ChartData(key, parsedValues));
      });
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                fetchedData.isNotEmpty
                    ? Column(
                        children: fetchedData
                            .map((chartData) => buildIndividualChart(chartData))
                            .toList(),
                      )
                    : const Text('Sem dados para exibir'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fechar o modal
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TodoListPage())); // Navegar para a página TodoListPage
                  },
                  child: const Text(
                    'Fechar',
                    style: TextStyle(
                      color: Color(0xff5bc2c9), // Altere a cor do texto aqui
                      fontSize: 16, // Tamanho da fonte (opcional)
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildIndividualChart(_ChartData chartData) {
    // late TooltipBehavior _tooltip;
    const myColor = Color.fromRGBO(8, 142, 255, 1);
    const constantTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );
    const constantDataLabelSettings = DataLabelSettings(
      isVisible: true,
      labelAlignment: ChartDataLabelAlignment.middle,
      textStyle: constantTextStyle,
    );
    return SizedBox(
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          labelStyle: constantTextStyle,
          minimum: chartData.y.reduce(min).toDouble(),
          maximum: chartData.y.reduce(max).toDouble(),
          interval: 1,
          labelFormat: '{value}',
        ),
        // tooltipBehavior: _tooltip,
        series: <ChartSeries>[
          BoxAndWhiskerSeries<_ChartData, String>(
            dataSource: [chartData],
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            name: chartData.x,
            color: myColor,
            dataLabelSettings: constantDataLabelSettings,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final List<double> y;
}
