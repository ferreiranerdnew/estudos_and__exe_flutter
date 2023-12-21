import 'package:flutter/material.dart';

class Scene extends StatelessWidget {
  const Scene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdbebeb), // Cor de fundo do Container
                          border: Border.all(
                            color: Colors.grey, // Cor da borda
                            width: 1.0, // Largura da borda
                          ),
                          borderRadius: BorderRadius.circular(
                              8.0), // Raio do canto da borda
                        ),
                        child: ListTile(
                          title: Text('Tarefa 1'),
                          subtitle: Text('20/11/2020'),
                          leading: Image.asset(
  'assets/icons/meu_icon.png',
  width: 30, // Largura do ícone
  height: 30, // Altura do ícone
),
                          onTap: () {
                            print('Tarefa 1');
                          },
                        ),
                      ),
                      SizedBox(height: 8), // Espaço entre os itens da lista
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdbebeb), // Cor de fundo do Container
                          border: Border.all(
                            color: Colors.grey, // Cor da borda
                            width: 1.0, // Largura da borda
                          ),
                          borderRadius: BorderRadius.circular(
                              8.0), // Raio do canto da borda
                        ),
                        child: ListTile(
                          title: Text('Tarefa 1'),
                          subtitle: Text('20/11/2020'),
                          leading: Icon(
                            Icons.save,
                            size: 30,
                          ),
                          onTap: () {
                            print('Tarefa 1');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
