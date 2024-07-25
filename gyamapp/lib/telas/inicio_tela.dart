import 'package:flutter/material.dart';
import 'package:gyamapp/servicos/autenticacao_servico.dart';

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela inicial"),),     
      drawer: Drawer(
        child: ListView(children: [
          ListTile(title: Text("Deslogar"),
            leading: Icon(Icons.logout),
            onTap: () => AutenticacaoServico().deslogar(),
            )
       ],
        ),
      ),
    );
  }
}