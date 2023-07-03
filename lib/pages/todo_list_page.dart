import 'package:flutter/material.dart';

// eu ainda não tenho nenhum estado, nada, então estou começando com Stateless, não Statefull
class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  // pegar o texto que o usuário digitou:
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // base de todas ou praticamente todas as telas
    return Scaffold(
      body: Center(
        child: Padding(
          // espaçamento na horizontal para o campo de texto
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                // pegar o texto que o usuário digitou:
                controller: emailController,
                // costumização do campo de texto
                decoration: const InputDecoration(
                  // título do campo de texto
                  labelText: "E-mail",
                  // dica do que escrever no campo de texto
                  hintText: "exemplo@exemplo.com",
                  // borda do campo de texto, englobando tudo

                  // --->    border: OutlineInputBorder(),    <---

                  // outro exemplo de borda que eu gosto mais, aquela que fica tipo voando, bem clean
                  border: InputBorder.none,
                  // especificar uma mensagem de erro:
                  errorText: "Campo Obrigatório!",
                  // botar um texto fixo, UM PREFIXO? tipo R$ de preço, isso nunca muda, certo?
                  //    ---- >      prefixText: "R\$ ",    < ----
                  // QUERO UM SUFIXO NO MEU TEXTO?
                  //    ---- >            suffixText: "cm",      < ----
                  //  style do label, só do label, do rótulo do meu campo de texto.
                  labelStyle: TextStyle(
                    // escolho o tamanho da minha fonte que fica dentro de TextStyle(),
                    fontSize: 20,
                  ),
                ),

                // esconder caracteres, tipo codificar, botar asteriscos, sca? É BOM PARA SENHAS.
                obscureText: true,
                // posso escolher como codificar os meus textos, números etc. Nesse caso, escolho codificá-los como $
                // como o cifrão tem um trabalho já dentro do Flutter, que é pegar uma variável e colocar no meio de um texto, para eu exibi-lo como caractere mesmo, eu tenho que botar uma barra invertida antes dele.
                // não funciona só botar o cifrão dentro das aspas, tem que ser "\$"
                obscuringCharacter: "\$",
                //quero mudar meu teclado somente para NUMÉRICO:
                //keyboardType: TextInputType.number,
                // quero o meu teclado com aquele formato para quem vai digitar e-mail, para facilitar:
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              ElevatedButton(
                onPressed: login,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    String text = emailController.text;
    print(text);
  }
}
