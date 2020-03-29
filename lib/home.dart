import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List aposta = [];
  double valor = 0;
  String label = "0";
  String _resultado = "Clique em gerar.";
  int qtde, x;
  var _sorteio = new Random();


  void _sortear() {

    aposta.removeRange(0, aposta.length);

    setState(() {
      qtde = valor.toInt();
    });
    
    if (qtde != 0) {

      //print("Quantidade de números $qtde");

     if (qtde==15) {

        while(aposta.length < qtde){

        x = _sorteio.nextInt(25);

         if(!aposta.contains(x) && x!=0){
            aposta.add(x);        
         }
         _resultado = aposta.toString().replaceAll("[","").replaceAll("]","").replaceAll(",", " ");
        }
        
     } else if(qtde==6 || qtde !=6) {


         while(aposta.length < qtde){

         x = _sorteio.nextInt(61);

         if(!aposta.contains(x) && x!=0){
            aposta.add(x);        
         }
        _resultado = aposta.toString().replaceAll("[","").replaceAll("]","").replaceAll(",", " ");

        }

     }                       
   
    } else {

      _resultado = "Informe a quantidade.";

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Números Aleatórios",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  valor = 0;
                  aposta.removeRange(0, aposta.length);
                  _resultado = "Clique em gerar.";
                });
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 30),
            child: Image.asset(
              "images/numbers.jpg",
              width: 191,
              height: 107,
            ),
          ),
          Text(
            "Quantidade",
            style: TextStyle(
              color: Colors.purple[700],
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "0",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(top: 10),
                child: Slider(
                  value: valor, //Valor inicial
                  min: 0,
                  max: 15,
                  label: label,
                  divisions: 15,
                  activeColor: Colors.purple,
                  inactiveColor: Colors.grey,
                  onChanged: (double novoValor) {
                    setState(() {
                      valor = novoValor;
                      label = novoValor.toString();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "15",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 15),
            child: Text(

              _resultado,             

              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green[300],
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(100, 25, 100, 0),
            child: Container(
              width: 5,
              child: RaisedButton(
                color: Colors.purple,
                child: Text(
                  "Gerar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: _sortear,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
