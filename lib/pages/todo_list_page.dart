import 'package:flutter/material.dart';
import 'package:todo_list/Widgets/todo_list_item.dart';
import 'package:todo_list/models/todo.dart';

// eu ainda não tenho nenhum estado, nada, então estou começando com Stateless, não Statefull
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  //pegar texto de um campo:
  final TextEditingController todoController = TextEditingController();

  // cada string é um título de uma tarefa
  List<Todo> tarefas = [];
  Todo? deleteTodo;
  int? deletedTodoPos;

  @override
  Widget build(BuildContext context) {
    // base de todas ou praticamente todas as telas
    return SafeArea(
      child: Scaffold(
        
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fundo5.jpeg'),
              fit: BoxFit.cover,
              //colorFilter: ColorFilter.linearToSrgbGamma(),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                //MENOR ALTURA POSSÍVEL DA COLUNA
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      // expandir o meu campo de texto até a máxima largura possível.
                      Expanded(
                        // peso do expanded
                        //  --->   flex: 2,
                        child: TextField(
                          // pegar texto de um campo
                          controller: todoController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelText: "O que tens a fazer?",
                            hintText:
                                "Ex.: Estudar Ruby, Caminhar, Estudar CN etc.",
                          ),
                        ),
                      ),
                      // espaço vazio entre eles
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          String text = todoController.text;
                          setState(() {
                            Todo newTodo = Todo(
                              title: text,
                              dateTime: DateTime.now(),
                            );
                            tarefas.add(newTodo);
                          });
                          //limpar o campo após adicionar a tarefa
                          todoController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.all(14)),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
      
                  // espaçamento entre as duas linhas (texto + botão)
                  const SizedBox(
                    height: 16,
                  ),
      
                  // permite que a lista tenha a maior altura que ela pode ocupar, ocupa o máximo de espaço que cabe e permite o scroll
                  Flexible(
                    // list view ( onde as tarefas irão ficar e podem roladas). É interessante que ela fique dentro de uma sizedBox
      
                    child: ListView(
                      // vai deixar a nossa lista o mais enxuta possível
                      shrinkWrap: true,
                      children: [
                        /* Container(
                        color: Colors.green[100],
                        
                        //width: 50, desnecessário
                        height: 50,
                      ),
                      Container(
                        color: Colors.blue[100],
                       
                        height: 50,
                      ),
                      Container(
                         color: Colors.purple[100],
                       
                        height: 50,
                      ),
                      Container(
                         color: Colors.red[100],
                        height: 50,
                      ),*/
      
                        for (Todo todo in tarefas)
      
                          //É UM ITEM DA SUA LISTA
                          /*ListTile(
                          title: Text(tarefa),
                          subtitle: Text(
                              'Data: ${dataAtual.day}/${dataAtual.month}/${dataAtual.year}'),
                          leading: const Icon(Icons.edit),
                          onTap: () {
                            print("Tarefa: $tarefa");
                          },
                        ),*/
      
                          TodoListItem(
                            todo: todo,
                            onDelete: onDelete,
                          ),
                      ],
                    ),
                  ),
      
                  const SizedBox(
                    height: 16,
                  ),
      
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Você possui ${tarefas.length} tarefas pendentes",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: showDeleteTodosConfirmationDialog,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.all(14)),
                        child: const Text(
                          "Limpar tudo",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    deleteTodo = todo;
    deletedTodoPos = tarefas.indexOf(todo);

    setState(() {
      tarefas.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi deletada com sucesso!',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.orange,
          onPressed: () {
            setState(() {
              tarefas.insert(deletedTodoPos!, deleteTodo!);
            });
          },
        ),
        duration: const Duration(seconds: 6),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog () {
    showDialog(context: context, builder: (context) =>  AlertDialog(
      title: const Text('Deletar TODAS as tarefas?'),
      content: const Text('Você tem certeza que quer prosseguir? Depois não tem como voltar atrás, hein!'),

      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.orange),
          onPressed: () {
            //só fecha a caixa de mensagem
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
          ),

        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
            deleteAllTarefas();
          },
          child: const Text('Deletar tudo'),
          ),
      ],
    ),
    );
  }

  void deleteAllTarefas () {
    setState(() {
      tarefas.clear();
    });
  }
}
