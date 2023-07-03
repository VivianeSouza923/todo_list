import 'package:flutter/material.dart';
import 'package:todo_list/pages/todo_list_page.dart';

void main(){

  //o aplicativo é um Widget
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // o MaterialApp é o widget principal do nosso app, traz navegação, temas, localização, traduções etc. Ele faz muitas coisas importantes.
    return  MaterialApp(
      // o home especifica a tela inicial do nosso app
      // ele espera também um widget, pois telas também são widgets
      home: TodoListPage(),

    );
  }
}



