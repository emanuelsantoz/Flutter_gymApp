import 'package:flutter/material.dart';
import 'package:gyamapp/_comum/meu_snackbar.dart';
import 'package:gyamapp/_comum/minhas_cores.dart';
import 'package:gyamapp/components/decoracao_campo_auteticacao.dart';
import 'package:gyamapp/servicos/autenticacao_servico.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<StatefulWidget> createState() {
    return AutenticacaoStats();
  }
}

// ignore: must_be_immutable
class AutenticacaoStats extends State {
  bool queroEntrar = false;
  final _fromKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

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
                        controller: _emailController,
                        decoration: getAutenticationInputDecoraton("E-mail"),
                        validator: (String? value) {
                          if (value == null) {
                            return "O e-mail não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "O e-mail é muito curto";
                          }
                          if (!value.contains("@")) {
                            return "O e-mail é invalido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAutenticationInputDecoraton("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "A senha é muito curta";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                          visible: queroEntrar,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _nomeController,
                                decoration:
                                    getAutenticationInputDecoraton("Nome"),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "O nome não pode ser vazio";
                                  }
                                  if (value.length < 5) {
                                    return "O nome é muito curto";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          style: ButtonStyle(backgroundColor:
                              WidgetStateColor.resolveWith((states) {
                            return MinhasCores.azulTopoGradiente;
                          })),
                          onPressed: () {
                            botaoPrincipal();
                          },
                          child: Text(
                              style: const TextStyle(color: Colors.white),
                              (queroEntrar) ? "Entrar" : "Cadastrar")),
                      const Divider(),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              queroEntrar = !queroEntrar;
                              print(queroEntrar);
                            });
                          },
                          child: Text(
                              style: const TextStyle(color: Colors.white),
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

  botaoPrincipal() {
    String email = _emailController.text;
    String nome = _nomeController.text;
    String senha = _senhaController.text;

    if (_fromKey.currentState!.validate()) {
      print("Form Valido");
      if (queroEntrar) {
        print(
            "${_nomeController.text}, ${_emailController.text}, ${_senhaController.text}");
        _autenticacaoServico
            .cadastrarUsuarios(nome: nome, email: email, senha: senha)
            .then((String? erro) {
          if (erro != null) {
            // Cadastro Error!
            mostrarSnackBar(context: context, texto: erro);
          } else {
            // Cadastro Sucesso!
            mostrarSnackBar(
                context: context,
                texto: "Usuario cadastrado com sucesso!",
                isError: false);
          }
        });
      } else {}
    } else {
      print("Form Inválido");
    }
  }
}
