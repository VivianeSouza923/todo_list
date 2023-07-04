import 'package:flutter/material.dart';

// eu ainda não tenho nenhum estado, nada, então estou começando com Stateless, não Statefull
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dataAtual = DateTime.now();
    

    // base de todas ou praticamente todas as telas
    return  Scaffold(
      
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //MENOR ALTURA POSSÍVEL DA COLUNA
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  // expandir o meu campo de texto até a máxima largura possível.
                  const Expanded(
                    // peso do expanded
                    //  --->   flex: 2,
                    child:  TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFB44A60),
                          ),
                        ),
                        labelText: "O que tens a fazer?",
                        hintText:
                            "Ex.: Estudar Flutter, Caminhar, Estudar CN etc.",
                      ),
                    ),
                  ),
                  // espaço vazio entre eles
                  const SizedBox(width: 8,),
                  ElevatedButton(
                    onPressed: () {
                  
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF722E43),
                      padding: const EdgeInsets.all(14)
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),

              // espaçamento entre as duas linhas (texto + botão)
              const SizedBox(height: 16,),

              // list view ( onde as tarefas irão ficar e podem roladas). É interessante que ela fique dentro de uma sizedBox
              ListView(
                // vai deixar a nossa lista o mais enxuta possível
                shrinkWrap: true,
                children:  [
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
                  
                  //É UM ITEM DA SUA LISTA 
                  ListTile(
                    title: const Text('Tarefa 1'),
                    subtitle: Text('Alta prioridade\nData: ${dataAtual.day}/${dataAtual.month}/${dataAtual.year}'),
                    leading: const Icon(Icons.edit),
                    onTap: () {
                      print("Tarefa 1");
                    },
                  ),

                  ListTile(
                    title: const Text('Tarefa 2'),
                    subtitle: Text('Data: ${dataAtual.day}/${dataAtual.month}/${dataAtual.year}'),
                    leading: const Icon(Icons.edit),
                    onTap: () {
                      print("Tarefa 2");
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16,),

              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Você possui 0 tarefas pendentes",
                      ),
                  ),
                    ElevatedButton(
                      onPressed: () {
                        

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF722E43),
                        padding: const EdgeInsets.all(14)
                      ),
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
    );
  }
}
