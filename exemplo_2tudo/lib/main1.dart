import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FERREIRA NERD B3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _acaoController = TextEditingController();
  TextEditingController _dataController = TextEditingController();

  Image? _image;
  bool _showFields = true;

  String formatDate(String input) {
    // Essa função vai formatar a entrada do usuário para yyyy-mm-dd
    input = input.replaceAll(RegExp(r'[^0-9]'), '');

    // Limitar o comprimento máximo para 8 caracteres (yyyy-mm-dd)
    if (input.length > 8) {
      input = input.substring(0, 8);
    }

    // Formatar para o padrão yyyy-mm-dd
    if (input.length >= 6) {
      input =
          '${input.substring(0, 4)}-${input.substring(4, 6)}-${input.substring(6, input.length)}';
    } else if (input.length >= 4) {
      input = '${input.substring(0, 4)}-${input.substring(4, input.length)}';
    }

    return input;
  }

  Future<void> _getGraphImage() async {
    String acoes = _acaoController.text;
    String inicio = _dataController.text;

    if (inicio.isEmpty) {
      // Adicione alguma lógica aqui se o campo de data estiver vazio
      return;
    }

    final response = await http.get(
      Uri.parse(
          'http://192.168.110.178:8120/graficos?acoes=$acoes&inicio=$inicio'),
    );

    if (response.statusCode == 200) {
      setState(() {
        _image = Image.memory(
          response.bodyBytes,
        );
        _showFields = false;
      });
    } else {
      setState(() {
        _image = null;
        _showFields = true;
      });
    }
  }

  void _destroyImage() {
    setState(() {
      _image = null;
      _showFields = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AÇÕES VARIAÇÃO MÉDIA'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_showFields) ...[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _acaoController,
                  decoration: InputDecoration(labelText: 'AÇÕES (PRETR4.SA,VALE3.SA,BRAP4.SA)'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _dataController,
                  decoration: InputDecoration(labelText: 'Data de Início (YYYY-MM-DD)'),
                  keyboardType: TextInputType.datetime,
                  onChanged: (value) {
                    // Chamada da função para formatar a data enquanto o usuário digita
                    _dataController.value = TextEditingValue(
                      text: formatDate(_dataController.text),
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: _dataController.text.length),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _getGraphImage,
                child: Text('ANALISAR EMPRESA'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
              ),
              SizedBox(height: 20),
            ],
            if (_image != null) ...[
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: _image!,
                ),
              ),
              ElevatedButton(
                onPressed: _destroyImage,
                child: Text('NOVA ANÁLISE'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
