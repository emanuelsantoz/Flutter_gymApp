import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gyamapp/_comum/minhas_cores.dart';

// ignore: must_be_immutable
class AutenticacaoTela extends StatelessWidget {
  bool queroEntrar = true;

  AutenticacaoTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                    MinhasCores.azulTopoGradiente,
                    MinhasCores.azulBaixoGradiente
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/logo.png", height: 158),
                  const Text(
                    textAlign: TextAlign.center,
                    "GymApp",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 32),
                  TextFormField(decoration: InputDecoration(label: Text("E-mail")),),
                  TextFormField(decoration: InputDecoration(label: Text("Senha")), obscureText: true, ),
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: () {},
                  child: Text((queroEntrar) ? "Entrar" : "Cadastrar")),
                  Divider(),
                  TextButton(
                    onPressed: () {
                    setState(( ) {
                      queroEntrar = !queroEntrar;
                      print(queroEntrar);
                    });
                  }, child: Text("Ainda não tenho uma conta"))
                ],
              ),
              ),
            )
            
          ],
        ));
  }
  
}
