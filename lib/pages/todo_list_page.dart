import 'package:flutter/material.dart';

// eu ainda não tenho nenhum estado, nada, então estou começando com Stateless, não Statefull
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // base de todas ou praticamente todas as telas
    return Scaffold(
      body: Center(
        child: Row(
          children: const [
            // expandir o meu campo de texto até a máxima largura possível.
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF120A8F),
                    ),
                  ),
                  labelText: "Adicione uma tarefa",
                  hintText:
                      "Ex.: Estudar Flutter, Caminhar, Estudar Cálculo II etc.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
