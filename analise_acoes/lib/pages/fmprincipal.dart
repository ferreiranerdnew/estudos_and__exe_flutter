/*

 */
import 'package:flutter/material.dart';

class Scene extends StatelessWidget {
  const Scene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              //  TODO: Criando a listviwer
              // TODO: o SizedBox tambem é um widget e serve para deter minar a largura de outros objetos,muitas veze sutilizamos como um widget vazio
              ListView(
                //  TODO: este comando shrinkWrap: = true deixa a lista o mais inchuta possivel
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
            ],
          ),
        ),
      ),
    );
  }
}
