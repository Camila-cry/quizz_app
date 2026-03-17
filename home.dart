import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int? respostaSelecionada;

  String pergunta = "Qual linguagem é usada para desenvolver apps Flutter?";

  List<String> opcoes = [
    "Java",
    "Dart",
    "Python",
    "C#"
  ];

  void verificarResposta() {

    if (respostaSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Escolha uma opção"))
      );
      return;
    }

    String resultado;

    if (respostaSelecionada == 1) {
      resultado = "Resposta correta 🎉";
    } else {
      resultado = "Resposta errada ❌";
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Resultado"),
        content: Text(resultado),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("OK")
          )
        ],
      ),
    );

  }

  Widget criarOpcao(int index) {

    return Card(
      child: RadioListTile(
        title: Text(opcoes[index]),
        value: index,
        groupValue: respostaSelecionada,
        onChanged: (value){
          setState(() {
            respostaSelecionada = value;
          });
        },
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz de Programação"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              pergunta,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 20),

            criarOpcao(0),
            criarOpcao(1),
            criarOpcao(2),
            criarOpcao(3),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: verificarResposta,
                child: const Text("Enviar resposta"),
              ),
            )

          ],
        ),
      ),
    );

  }
}
