import 'package:flutter/material.dart';
import 'package:analise_acoes/utils.dart';

class Scene extends StatelessWidget {
  const Scene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const myTextColor = Color(0xff575f61);
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
                              24.0), // Raio do canto da borda
                        ),
                        child: ListTile(
                          title: Text(
                            'Média',
                            style: SafeGoogleFont(
                              'Irish Grover',
                              fontSize: 30 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.21 * ffem / fem,
                              color: myTextColor,
                            ),
                          ),
                          subtitle: Text(
                            'Ações',
                            style: SafeGoogleFont(
                              'Irish Grover',
                              fontSize: 22 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.21 * ffem / fem,
                              color: myTextColor,
                            ),
                          ),
                          leading: Image.asset(
                            'assets/page-1/images/icons8investimento-1.png',
                            width: 40, // Largura do ícone
                            height: 40, // Altura do ícone
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
                              24.0), // Raio do canto da borda
                        ),
                        child: ListTile(
                          title: Text(
                            'Matriz',
                            style: SafeGoogleFont(
                              'Irish Grover',
                              fontSize: 30 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.21 * ffem / fem,
                              color: myTextColor,
                            ),
                          ),
                          subtitle: Text(
                            'Correlação',
                            style: SafeGoogleFont(
                              'Irish Grover',
                              fontSize: 22 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.21 * ffem / fem,
                              color: myTextColor,
                            ),
                          ),
                          leading: Image.asset(
                            'assets/page-1/images/icons8investcorrelacao-1.png',
                            width: 40, // Largura do ícone
                            height: 40, // Altura do ícone
                          ),
                          onTap: () {
                            print('Tarefa 1');
                          },
                        ),
                      ),
                      // BUG
                      SizedBox(height: 8), // Espaço entre os itens da lista
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdbebeb), // Cor de fundo do Container
                          border: Border.all(
                            color: Colors.grey, // Cor da borda
                            width: 1.0, // Largura da borda
                          ),
                          borderRadius: BorderRadius.circular(
                              24.0), // Raio do canto da borda
                        ),
                        child: ListTile(
                          title: Text(
                            'Média',
                            style: SafeGoogleFont(
                              'Irish Grover',
                              fontSize: 30 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.21 * ffem / fem,
                              color: myTextColor,
                            ),
                          ),
                          subtitle: Text(
                            'Ações',
                            style: SafeGoogleFont(
                              'Irish Grover',
                              fontSize: 22 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.21 * ffem / fem,
                              color: myTextColor,
                            ),
                          ),
                          leading: Image.asset(
                            'assets/page-1/images/icons8investimento-1.png',
                            width: 40, // Largura do ícone
                            height: 40, // Altura do ícone
                          ),
                          onTap: () {
                            print('Tarefa 1');
                          },
                        ),
                      ),
                      // BUG
                      SizedBox(height: 8), // Espaço entre os itens da lista
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdbebeb), // Cor de fundo do Container
                          border: Border.all(
                            color: Colors.grey, // Cor da borda
                            width: 1.0, // Largura da borda
                          ),
                          borderRadius: BorderRadius.circular(
                              24.0), // Raio do canto da borda
                        ),
                        child: ListTile(
                          title: Text(
                            'Média',
                            style: SafeGoogleFont(
                              'Irish Grover',
                              fontSize: 30 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.21 * ffem / fem,
                              color: myTextColor,
                            ),
                          ),
                          subtitle: Text(
                            'Ações',
                            style: SafeGoogleFont(
                              'Irish Grover',
                              fontSize: 22 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.21 * ffem / fem,
                              color: myTextColor,
                            ),
                          ),
                          leading: Image.asset(
                            'assets/page-1/images/icons8investimento-1.png',
                            width: 40, // Largura do ícone
                            height: 40, // Altura do ícone
                          ),
                          onTap: () {
                            print('Tarefa 1');
                          },
                        ),
                      ),
                      // BUG
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
