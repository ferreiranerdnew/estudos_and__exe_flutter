/* RF TOP PAGINA todo_list_item.dat

passar informações de item pais para filhos ou vice versa
do pai para o filho : sempre passar atravez d eum parametro
do filho para o pai : utilizar um callback

 */
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:analise_acoes/pages/fmprincipal.dart';
import 'package:flutter/material.dart';
import 'package:analise_acoes/models/todo.dart';
import 'package:analise_acoes/repositories/todo_repository.dart';
import 'package:analise_acoes/wigets/analise_acoes_item.dart';
import 'package:analise_acoes/utils.dart';

// import 'dart:typed_data';
// import 'package:myapp/main.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();
  // RF Instanciando anuncio GOOGLE ADMOB
  InterstitialAd? _interstitialAd;

  //recebendo informações persistidas do shared_preferences
  final TodoRepository todoRepository_1 = TodoRepository();

  // List<String> todos = [];
  // buscando a informação dentro da classe Todo na pasta models
  List<Todo> todos = [];
  // BUG  TENTAR ATUALIZAR flutter_slidable: E USAR A FUNÇÃO ABAIXO COM onPressed:  SEGUINDO A DOCUMENTAÇÃO REFAZER O actionPane: PARA endactionPane:   do todo_list_item.dart
  Todo? deletedTodo;
  int? deletedTodoPos;
  String? errorText_1;

  @override
  void initState() {
    super.initState();
    todoRepository_1.getTodoList_1().then((value) {
      setState(() {
        todos = value;
      });
    });
    _createInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    const myTextColor = Color(0xff575f61);
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    // RF 01 CORRIGIR OS ELEMENTOS QUE PASSA ACIMA DA SINFORMAÇÕES DO CELULAR COLOCAR O Scaffold DENTRO DE UM WIGET SafeArea, vai manter dentro da area segura do dispositivo
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/page-1/images/logofnb3comborda.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            // RF 02 apos colocar o 01 corrigir padding: const EdgeInsets.symmetric(horizontal: 16), para oque ficou abaixo
            // assim temos uma melhor distancia da barra superior com nosso campos o valro de 16 e de escolha propria
            //descola tanto em ciam quando em baixo
            padding: const EdgeInsets.all(16),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Alinhamento no início (lado esquerdo)
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
    _showInterstitialAd(); // Chama a função primeiro
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Scene()),
    );

                        // Ação ao pressionar o botão elevado com ícone
                      },
                      icon: Image.asset(
                        'assets/page-1/images/icons8retornar100-1.png', // Caminho do seu ícone nos ativos
                        width: 30, // Largura do ícone
                        height: 30, // Altura do ícone
                      ),
                      label: Text(
                        'Retornar\n  Home',
                        style: SafeGoogleFont(
                          'Irish Grover',
                          fontSize: 17 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.21 * ffem / fem,
                          color: myTextColor,
                        ),
                      ), // Texto ao lado do ícone
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // Tornando a cor do botão transparente
                        elevation: 0, // Removendo sombra
                        // Outros atributos que você deseja definir
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ADD Ticket da Ação',
                          labelStyle: const TextStyle(
                            color: Color(0xff5bc2c9),
                          ),
                          hintText: 'Ex. PETR4',
                          errorText: errorText_1,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff5bc2c9),
                              //deixar a linha da borda mais grossa
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // RF onPressed; shared_preferences; toUpperCase(),trim()
                        //  pegando a informação digitada na labal
                        String text = todoController.text
                            .toUpperCase()
                            .trim(); // Converte para maiúsculas, trim() retira todos os espaços em branco
                        //verificar se o labal esta empty caso seja true retornar um erro
                        if (text.isEmpty) {
                          setState(() {
                            errorText_1 = 'O campo não pode ser vazio!';
                          });
                          return;
                        }
                        //  comando para o flutter refazer a tela

                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                          //caso seja ok zerar a variaveld e erro
                          errorText_1 = null;
                        });
                        //  comando de limpar a label apso execução
                        todoController.clear();
                        //salvando a lista de todos no shared_preferences
                        todoRepository_1.saveTodoList(todos);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5bc2c9),
                        //  ESPAÇAMENTO BUTTON ENTRE O TEXTO
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      //  pode ser desta forma com simbolo ou com icon
                      // child: Text(
                      //   '+',
                      //   style: TextStyle(fontSize: 40),
                      //  colocando o sinal de + com um icon
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // RF SizedBox; listviwer; scroll; buttom; variaveis; length = len;
                //  Criando a listviwer
                //  o SizedBox tambem é um widget e serve para deter minar a largura de outros objetos,muitas veze sutilizamos como um widget vazio
                // colocando a ListView dentro de um wiget flexible, par acresce e não quebrar a tela, possibilitando scroll
                Flexible(
                  child: ListView(
                    //   este comando shrinkWrap: = true deixa a lista o mais inchuta possivel tambem possibilitando o crescimento importante
                    shrinkWrap: true,
                    children: [
                      //  utiliza rum comando for dentrod a lista para apresenatr em tela
                      for (Todo todo in todos)
                        // criando um wiget personalizado proprio em uma todo_list_item.dart esta dentro da pasta de wigets
                        TodoListItem(
                          // passar o objeto todo por completo
                          todo: todo,
                          // passando o callback de filho para pai
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                //  iniciando uma nova row com cmapo de texto e um buttom
                Row(
                  children: [
                    //  Expanded utiliza a maior area disponivel na row ateo proximo objeto
                    Expanded(
                      child: Text(
                        // consumindo a variavel todos e contandop quantos elementos temso dentrod a mesma length = len
                        'Você possui ${todos.length} empresas cadastradas',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: showDleteTodosConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5bc2c9),
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Limpar Tudo',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Ação ao pressionar o botão flutuante (adicionar novo item, por exemplo)
        //   },
        //   child: Icon(Icons.add), // Ícone do botão flutuante (pode ser personalizado)
        //   backgroundColor: Colors.blue, // Cor de fundo do botão flutuante
        // ),
      ),
    );
  }

  /*exemplo de um callback passando de filho para pai
  */
  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    //salvando a lista de todos no shared_preferences
    todoRepository_1.saveTodoList(todos);

    //apresentar messagem no rodape da pagina ao deleta rum item ou tarefa
    // e adcionar um buttom para desfazer a ação do delete
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // comando para limpar a snck bar rapidamente
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Empresa ${todo.title} foi removida com sucesso !',
          style: TextStyle(color: Color(0xff060708)),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          // mudar a cor do buttom
          textColor: const Color(0xff5bc2c9),
          onPressed: () {
            // BUG o ponto de ! e para garantir ao sistema que a variavel não e null da Mesma forma que ? você est ainformando que criou a variavel null
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
            //salvando a lista de todos no shared_preferences
            todoRepository_1.saveTodoList(todos);
          },
        ),
        // identificar a duração do snack bar na tela
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo'),
        content:
            Text(' Vocês tem certeza que deseja apagar todas as EMPRESAS? '),
        actions: [
          TextButton(
            onPressed: () {
              // fechar o dialogo sem nenhuma mudança pelo botão cancelar
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Color(0xff00d7f3)),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 243, 0, 0)),
            child: Text('Limpar Tudo'),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
    //salvando a lista de todos no shared_preferences
    todoRepository_1.saveTodoList(todos);
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
