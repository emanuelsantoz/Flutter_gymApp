import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gyamapp/autenticacao_tela.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gyamapp/telas/inicio_tela.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyFirstTela());
}

class MyFirstTela extends StatelessWidget {
  const MyFirstTela({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RoteadorTela(),
    );
  }
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return const InicioTela();
        } else{
          return const AutenticacaoTela();
        }
      },
    );
  }
}
