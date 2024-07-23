import 'package:flutter/material.dart';
import 'package:gyamapp/autenticacao_tela.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
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
