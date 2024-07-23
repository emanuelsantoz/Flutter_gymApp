import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gyamapp/_comum/minhas_cores.dart';
import 'package:gyamapp/components/decoracao_campo_auteticacao.dart';

class AutenticacaoTela extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AutenticacaoStats();
  }
}

// ignore: must_be_immutable
class AutenticacaoStats extends State {
  bool queroEntrar = true;
  final _fromKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
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
                key: _fromKey,
                child: Center(
                  child: SingleChildScrollView(
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
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: getAutenticationInputDecoraton("E-mail"),
                        validator: (String? value) {
                          if(value == null){
                            return "O e-mail não pode ser vazio";
                          }
                          if(value.length < 5){
                            return "O e-mail é muito curto";
                          }
                          if(!value.contains("@")){
                            return "O e-mail é invalido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: getAutenticationInputDecoraton("Senha"),
                        obscureText: true,
                      ),
                      SizedBox(height: 8),
                      Visibility(
                          visible: !queroEntrar,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: getAutenticationInputDecoraton("Confirme senha"),
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 8
                              ),
                              TextFormField(
                                decoration: getAutenticationInputDecoraton("Nome"),
                              ),
                            ],
                          )),
                      const SizedBox(height: 16),
                      ElevatedButton(

                                                style: ButtonStyle(backgroundColor: WidgetStateColor.resolveWith((states) {
                                                  return  MinhasCores.azulTopoGradiente;
                                                }
                                                )),
                        // MaterialStateProperty
                        //                 .resolveWith<Color?>((states) {
                        //               if (states
                        //                   .contains(MaterialState.pressed)) {
                        //                 return Theme.of(context).primaryColor;
                        //               }
                        //               return Colors.green;
                        //             }), minimumSize:
                        //                 MaterialStateProperty.resolveWith(
                        //                     (states) {
                        //               return const Size(50, 50);
                        //             })),

                          onPressed: () {
                            botaoPrincipal();
                          },
                          child: Text( style: TextStyle(color: Colors.white),
                            (queroEntrar) ? "Entrar" : "Cadastrar")),
                      const Divider(),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              queroEntrar = !queroEntrar;
                              print(queroEntrar);
                            });
                          },
                          child: Text(style: TextStyle(color: Colors.white),
                            (queroEntrar)
                              ? "Ainda não tenho uma conta? Cadastre-se"
                              : "Já tem conta? Entre!")),
                    ],
                  )),
                ),
              ),
            )
          ],
        ));
  }

  botaoPrincipal(){
    if(_fromKey.currentState!.validate()){
      print("Form Invalido");
    } else {
      print("Form inválido");
    }
  }
}
