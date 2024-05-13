import 'package:flutter/material.dart';
import 'package:gyamapp/autenticacao_tela.dart';
import 'package:gyamapp/exercicios/exercicio_tela.dart';


void main(){
  runApp( const MyFirstTela());
}

class MyFirstTela extends StatelessWidget{
  const MyFirstTela({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AutenticacaoTela(),
    );
  }}