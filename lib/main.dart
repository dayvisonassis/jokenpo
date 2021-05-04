import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Jokenpo(),
    debugShowCheckedModeBanner: false,
  )
  );

}

class Jokenpo extends StatefulWidget {
  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {

  var imagemapp = AssetImage ("assets/padrao.png"); // necessário utilizar o AsstImage ao inves do Image.asset pois o primeiro tem o atributo this.
                                                   // que permitirá chamar a variável com a imagem atual, que ira mudar, dentro do corpo do app.
  var mensagem = "Resultado";

  void opcaoSelecionada(String escolhaUsuario){

      var opcoes = ["pedra", "papel", "tesoura"];
      var random  = Random().nextInt(3);
      var escolhaApp = opcoes [random];

      print("Escolha do usuario:"+ escolhaUsuario);
      print("Escolha do App:"+ escolhaApp);
      
      switch(escolhaApp) {
        case "pedra" :
          setState(() {
            this.imagemapp = AssetImage("assets/pedra.png");
          });
          break;
        case "papel" :
          setState(() {
            this.imagemapp = AssetImage("assets/papel.png");
          });
          break;
        case "tesoura" :
          setState(() {
            this.imagemapp = AssetImage("assets/tesoura.png");
          });
          break;
      }
        // validação do ganhador
          //usuario ganhador
          if (
            (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
            (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
            (escolhaUsuario == "papel" && escolhaApp == "pedra")
          ) {
            setState(() {
              this.mensagem = "Parabens, você ganhou!";
            });
          }
          else if (

          (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
              (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
              (escolhaApp == "papel" && escolhaUsuario == "pedra")

          ){
          setState(() {
            this.mensagem = "Você perdeu!";
          });
          }
          else {
            setState(() {
              this.mensagem = "Empatamos!";
            });
       }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("JOKENPO"),
        //backgroundColor: Colors.red,
      ),
      body: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Escolha do APP",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                  ),
                ),
               // Image(image: this.imagemapp),
                Image(image: this.imagemapp),
                Text(this.mensagem,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                    onTap: (){
                      opcaoSelecionada("pedra");
                        },
                      child: Image.asset("assets/pedra.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    GestureDetector(
                        onTap: (){
                          opcaoSelecionada("papel");
                        },
                      child: Image.asset("assets/papel.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        opcaoSelecionada("tesoura");
                      },
                      child: Image.asset("assets/tesoura.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                )
          ],
        ),
      )),

    );
  }
}
