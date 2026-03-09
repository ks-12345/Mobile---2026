// Importa a biblioteca principal do Flutter para criar interfaces
import 'package:flutter/material.dart';

void main() {
  // Inicia o aplicativo Flutter
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa "debug"
      home: HumorApp(), // Define a tela principal
    ),
  );
}

// Classe principal do aplicativo (Stateful porque o estado muda)
class HumorApp extends StatefulWidget {
  @override
  _HumorAppState createState() => _HumorAppState();
}

// Classe que controla o estado da aplicação
class _HumorAppState extends State<HumorApp> {
  // Variável booleana que controla se a "luz" está ligada ou desligada
  List<String> textos = ["Bravo", "Feliz", "Neutro"];

  List<String> emoji = ["😡", "😁", "😑"];

  List<Color> cores = [Colors.red, Colors.yellow, Colors.grey];

  int indice = 0;

  // Função responsável por alternar o estado da luz
void alternar() {
  setState(() {
    indice++;

    if (indice >= textos.length) {
      indice = 0;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    // Scaffold é a estrutura básica da tela
    return Scaffold(
      // Cor de fundo muda dependendo do estado
      backgroundColor: cores[indice],

      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text(
          "Mudar o Humor",
          style: TextStyle(
            // Cor do texto muda dependendo do estado
            color: Colors.white,
          ),
        ),
      ),

      // Corpo da aplicação
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // Ícone da lâmpada (ligada ou desligada)
          Text(emoji[indice]),

            // Espaço entre os elementos
            SizedBox(height: 60),

            // Botão que liga ou desliga a luz
            ElevatedButton(
              onPressed: alternar, // Chama a função ao clicar

              style: ElevatedButton.styleFrom(
                // Cor do botão muda conforme o estado
                backgroundColor: cores[indice],
              ),

              child: Text(
                "Humor",
                style: TextStyle(
                  // Cor do texto do botão
                 color: cores[indice],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
