import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:analise_acoes/pages/analise_acoes_page.dart';

import 'pages/fmprincipal.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scene(),
    );
  }
}
