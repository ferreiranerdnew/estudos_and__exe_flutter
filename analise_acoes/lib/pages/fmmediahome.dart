import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:analise_acoes/pages/analise_acoes_page.dart';
// import 'package:analise_acoes/wigets/analise_acoes_item.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
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
    // RF Instanciando anuncio GOOGLE ADMOB
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _dataController = TextEditingController();
    initialDate = DateTime.now().subtract(Duration(days: 60));

    String initialFormattedDate =
        "${initialDate.year}-${initialDate.month.toString().padLeft(2, '0')}-${initialDate.day.toString().padLeft(2, '0')}";

    _dataController.text = initialFormattedDate;
     _createInterstitialAd();
    
    
  }
  // _showInterstitialAd();

  @override
  Widget build(BuildContext context) {
    // print(widget.todoTitle);
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
                  color: const Color(0xffdbebeb),
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

                    // RF Colocando um ponto de espera para o usuario um circulo de processamento
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Impede o fechamento do diálogo ao tocar fora dele
                      builder: (BuildContext context) {
                        return Center(
                          child:
                              CircularProgressIndicator(), // Indicador de progresso circular
                        );
                      },
                    );

                    try {
                      final response = await http.get(url);

                      if (response.statusCode == 200) {
                        final responseData = json.decode(response.body);
                        // print(responseData);

                        // Navegue para a próxima página passando os dados brutos
                        showChartModal(context, responseData);
                      } else {
                        // Exibir uma mensagem ao usuário quando a resposta não é bem-sucedida
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Alerta"),
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline, // Ícone de alerta
                                    color:
                                        Colors.red, // Cor do ícone (opcional)
                                  ),
                                  SizedBox(
                                      width:
                                          8), // Espaçamento entre o ícone e o texto
                                  Text("Verificar o ticket \n da empresa !!"),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // fechar o dialogo sem nenhuma mudança pelo botão cancelar
                                    Navigator.of(context)
                                        .pop(); // Fechar o modal
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            TodoListPage())); // Navegar para a página TodoListPage
                                  },
                                  style: TextButton.styleFrom(
                                      foregroundColor: Color(0xff00d7f3)),
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
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

// RF inicio configuração do modal onde é apresentando o gráfico
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
                    _showInterstitialAd();
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

// RF GOOGLE ADMOB 22/12/2023
  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (InterstitialAd ad) {
            // debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            this._interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Anuncio Null');
      return;
    }
    _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('%ad onAdShowedFullScreenContent 2'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent. 3 ');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent 4: $error');
        ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) => print('$ad impression ocurred 5.'),
    );
    _interstitialAd!.show();
  }




}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final List<double> y;
}
