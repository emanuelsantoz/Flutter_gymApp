import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gyamapp/modelos/exercicio_modelo.dart';
import 'package:gyamapp/modelos/sentimento_modelo.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "001",
      comoFazer: "Puxa para baixo e foque no trapzio",
      name: "Treino A",
      treino: "Costa");

  final List<Sentimento> listSentimentos = [
    Sentimento(id: "SE001", data: "2022-01-01", sentimento: "Não senti nada!"),
    Sentimento(id: "TE001", data: "2022-02-01", sentimento: "Doue!"),
    Sentimento(id: "SE001", data: "2022-01-01", sentimento: "Não senti nada!"),
    Sentimento(id: "TE001", data: "2022-02-01", sentimento: "Doue!"),
    Sentimento(id: "SE001", data: "2022-01-01", sentimento: "Não senti nada!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Color(0xFF0A6D92),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white),
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
        title: Column(children: [
          Text(exercicioModelo.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          Text(exercicioModelo.treino, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
        ],)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(4),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: ListView(children: [
          SizedBox(
              height: 250,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Tira Foto",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ])),
          const SizedBox(height: 5),
          const Text(
            "Como Fazer?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(exercicioModelo.comoFazer,
              style: TextStyle(color: Colors.black87)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(color: Colors.black),
          ),
          const Text("Como estou me sentendo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(listSentimentos.length, (index) {
              Sentimento sentimentoAgora = listSentimentos[index];
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(sentimentoAgora.sentimento),
                subtitle: Text(
                  sentimentoAgora.data,
                  style: TextStyle(color: Color.fromARGB(178, 0, 0, 0)),
                ),
                leading: Icon(Icons.double_arrow),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: (() =>
                      {print("Deletar ${sentimentoAgora.sentimento}")}),
                ),
              );
            }),
          ),
        ]),
      ),
    );
  }
}
