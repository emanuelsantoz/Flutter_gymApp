import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuarios(
      {required String nome,
      required String email,
      required String senha}) async {
    try {
      UserCredential userCredencial = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      await userCredencial.user!.updateDisplayName(nome);

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "O usuario já esta cadastrado!";
      }
    }
    return null;
  }

  Future<String?> LoginUsuario({required email, required senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> deslogar() async {
    return _firebaseAuth.signOut();
  }
}
