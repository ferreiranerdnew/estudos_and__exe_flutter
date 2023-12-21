import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:analise_acoes/models/todo.dart';

const todoListKey = 'analise_acoes';
class TodoRepository {

  // RF late
  /*late significa que ser ainiciada no futuro a variavel e so podemos utilizar depois que a mesma for reiniciada 
  poderia ficar desta forma tambe, SharedPreferences? sharePreferences;  indicando que a variavel não é null
   */
  late SharedPreferences sharePreferences;

  Future<List<Todo>> getTodoList_1() async{
    sharePreferences = await SharedPreferences.getInstance();
    // caso não encontrar um valor anterior e seja  aprimeir avez do usuario iniciar uam lista vazia ?? '[]'
    final String jsonString = sharePreferences.getString(todoListKey)?? '[]';
    final List jsonDecode = json.decode(jsonString) as List;
    return jsonDecode.map((e) => Todo.fromJson_1(e)).toList();

  }

 //Salvando informações, precisa criar um function esta informações são carregadas do todo.dart apos inicialização
 //fica um pouco confuso porém estas informaçõe sdeve ser carregadas no todo_list_page.dart
 void saveTodoList(List<Todo> todos){
  //converter a lista todo em um Json 
  // desta forma a lista e transforma em um json
  final String jsonString =  json.encode(todos);
  // armazenando salvando
  sharePreferences.setString(todoListKey, jsonString);
 }
}