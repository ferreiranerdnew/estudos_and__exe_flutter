/* RF topo classe todo models
classe criada par afazer o tratamento da data e hora
acesso a todo_repository.dart  transformando a sinformações em um mapa
 
 */

class Todo {
  Todo({required this.title, required this.dateTime});

  Todo.fromJson_1(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['datetime']);

  String title;
  DateTime dateTime;

  // RF toJson;
  /*passando informações da minha Class Todo para oshared_preferences 
  com intuido de persistir as informações apso fechar o aplicativo
  OBs: shared_preferences guarda pequenas informações não é um banco de dados
  */
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'datetime': dateTime.toIso8601String(),
    };
  }
}
