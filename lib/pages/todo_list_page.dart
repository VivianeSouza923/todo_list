import 'package:flutter/material.dart';

// eu ainda não tenho nenhum estado, nada, então estou começando com Stateless, não Statefull
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // base de todas ou praticamente todas as telas
    return const Scaffold(
      body: Center(
        child: Padding(
          // espaçamento na horizontal para o campo de texto
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            // costumização do campo de texto
            decoration: InputDecoration(
                // título do campo de texto
                labelText: "E-mail",
                // dica do que escrever no campo de texto
                hintText: "exemplo@exemplo.com",
                // borda do campo de texto, englobando tudo

                // --->    border: OutlineInputBorder(),    <---

                // outro exemplo de borda que eu gosto mais, aquela que fica tipo voando, bem clean
                border: InputBorder.none,
                // especificar uma mensagem de erro:
                errorText: "Campo Obrigatório!"
                ),

                // esconder caracteres, tipo codificar, botar asteriscos, sca? É BOM PARA SENHAS.
                obscureText: true,
                // posso escolher como codificar os meus textos, números etc. Nesse caso, escolho codificá-los como *
                obscuringCharacter: "*",
          ),
        ),
      ),
    );
  }
}
