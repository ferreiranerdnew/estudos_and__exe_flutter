import 'package:analise_acoes/pages/fmmediahome.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:analise_acoes/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  // definir um parametro obrigadorio required this.title  e final String? title;  ( o ? define que não pode ser null)
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.onDelete,
  }) : super(key: key);

  // final String title;
  final Todo todo;
  // RF recebendo o callback de filho para pai, sempre procurar como callback ou de filho para pai esta referenciado desta forma
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    // RF PEDDING; Column; eixocruzado; fonte; margin; DateFormat; stretch = coluna sempre eocupar a maior largura possivel sempre
    // quando se utiliza um Container o mesmo por padrão tem  um parametro de PEDDING
    // Resumo  "margin"  afastamento forda do container, "pedding" afastamento dentro do container
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[200],
          ),
          // o parametro margin e parecido com o padding, porém ao inverso d ao afastamento por fora do container
          // assim conseguimos separar os itens dentro da lista deixando um aspecto com uma linha no meio de cada um
          // margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.all(16),
          //  colocando os textop dentro da coluna, a mesma por padrão mantem seus item centralizados
          child: Column(
            //  expecificar o alinhamento do eixocruzado star = esqueda, end = direita, center = centro
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                // para utilizar o Dateformat, é preciso ter a dependencia intl:, importada
                // verificar a documentação, porém caso fique assim 'dd/MMM/yyyy' com 3 M modifica para o nome do mês em ingles
                // existe formar par adeixar em portugues tambem
                // outra forma e 'dd/MM/yyyy - EE ' mostr ao dia da semana
                DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime),
                // todo.dateTime.toString(),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  // deixando a fonte em negrito mais conhecido como dar peso ao texto
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actionExtentRatio: 0.20,
        actionPane: const SlidableStrechActionPane(),
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              // print(todo.title);
              onDelete(todo);
            },
          ),
          IconSlideAction(
            caption: 'Analisar \n   Média',
            color: Colors.blue,
            icon: Icons.analytics_sharp,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: SingleChildScrollView(
                      child: SceneMedia(todoTitle: todo.title),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
//  void doNothing(BuildContext context) {}
