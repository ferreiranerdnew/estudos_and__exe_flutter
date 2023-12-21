/*

 */
import 'package:flutter/material.dart';

class Scene extends StatelessWidget {
  const Scene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            // RF 02 apos colocar o 01 corrigir padding: const EdgeInsets.symmetric(horizontal: 16), para oque ficou abaixo
            // assim temos uma melhor distancia da barra superior com nosso campos o valro de 16 e de escolha propria
            //descola tanto em ciam quando em baixo
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row(
                //   children: [
                //     Expanded(
                //       child: TextField(
                //         controller: todoController,
                //         decoration: InputDecoration(
                //             border: OutlineInputBorder(),
                //             labelText: 'Adicione uma tarefa',
                //             labelStyle: TextStyle(
                //               color: Color(0xff00d7f3),
                //             ),
                //             hintText: 'Ex. Estudar Flutter',
                //             errorText: errorText_1,
                //             focusedBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                 color: Color(0xff00d7f3),
                //                 //deixar a linha da borda mais grossa
                //                 width: 2,
                //               ),
                //             )),
                //       ),
                //     ),
                //     SizedBox(width: 8),
                //     ElevatedButton(
                //       onPressed: () {
                //         // RF onPressed; shared_preferences
                //         //  pegando a informação digitada na labal
                //         String text = todoController.text;
                //         //verificar se o labal esta empty caso seja true retornar um erro
                //         if (text.isEmpty) {
                //           setState(() {
                //             errorText_1 = 'O título não pode ser vazio!';
                //           });
                //           return;
                //         }
                //         //  comando para o flutter refazer a tela

                //         setState(() {
                //           Todo newTodo = Todo(
                //             title: text,
                //             dateTime: DateTime.now(),
                //           );
                //           todos.add(newTodo);
                //           //caso seja ok zerar a variaveld e erro
                //           errorText_1 = null;
                //         });
                //         //  comando de limpar a label apso execução
                //         todoController.clear();
                //         //salvando a lista de todos no shared_preferences
                //         todoRepository_1.saveTodoList(todos);
                //       },
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Color.fromARGB(255, 102, 255, 255),
                //         //  ESPAÇAMENTO BUTTON ENTRE O TEXTO
                //         padding: EdgeInsets.all(16),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //       ),
                //       //  pode ser desta forma com simbolo ou com icon
                //       // child: Text(
                //       //   '+',
                //       //   style: TextStyle(fontSize: 40),
                //       //  colocando o sinal de + com um icon
                //       child: const Icon(
                //         Icons.add,
                //         size: 30,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 16),
                // RF SizedBox; listviwer; scroll; buttom; variaveis; length = len;
                //  Criando a listviwer
                //  o SizedBox tambem é um widget e serve para deter minar a largura de outros objetos,muitas veze sutilizamos como um widget vazio
                // colocando a ListView dentro de um wiget flexible, par acresce e não quebrar a tela, possibilitando scroll
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                                            ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                      
                      ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.save,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 1');
                        },
                      ),
                      ListTile(
                        title: Text('Tarefa 1'),
                        subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        leading: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa 2');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                //  iniciando uma nova row com cmapo de texto e um buttom
                // Row(
                //   children: [
                //     //  Expanded utiliza a maior area disponivel na row ateo proximo objeto
                //     Expanded(
                //       child: Text(
                //         // consumindo a variavel todos e contandop quantos elementos temso dentrod a mesma length = len
                //         'Você possui ${todos.length} tarefas pendesnte',
                //       ),
                //     ),
                //     ElevatedButton(
                //       onPressed: showDleteTodosConfirmationDialog,
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Color.fromARGB(255, 102, 255, 255),
                //         padding: EdgeInsets.all(16),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //       ),
                //       child: Text(
                //         'Limpar Tudo',
                //         style: TextStyle(
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
