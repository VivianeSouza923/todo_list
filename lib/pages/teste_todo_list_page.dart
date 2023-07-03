import 'package:flutter/material.dart';

// eu ainda não tenho nenhum estado, nada, então estou começando com Stateless, não Statefull
class TestTodoListPage extends StatelessWidget {
  TestTodoListPage({super.key});

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
            // altura mínima da coluna
            mainAxisSize: MainAxisSize.min,
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
                // função que será chamada sempre que houver uma modificação no conteúdo desse campo de texto
                onChanged: onChanged,
                onSubmitted: onSubmited,

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
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // função do login
  void login() {
    // criei uma variável que vai pegar esse texto da caixa de texto, o texto que o usuário digitou
    String text = emailController.text;
    // agora só printar
    print(text);
    //apagar o texto, após ele entrar
    //   --->     emailController.clear();   <---
    // modificar o conteúdo do campo
    emailController.text = "Vivi";
  }

  //text - texto que o meu campo vai me mandar toda vez que eu fizer uma alteração no campo, ou seja, o texto atualizado.
  void onChanged(String text) {
   // print(text);
  }

  // sempre que eu digitar um texto e apertar o botão azul do teclado (o que tem o check), ele chama esse função
  void onSubmited(String text){
    // printa no console
    print(text);
  }
}
