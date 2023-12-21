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
                      ListTile(
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
                      ListTile(
                        title: Text('Tarefa 2'),
                        subtitle: Text('20/11/2020'),
                        leading: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        onTap: () {
                          print('Tarefa 2');
                        },
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
