import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _auth =  FirebaseAuth.instance;
  Future<User?> signUpWithEmailAndPassword(String email, String password) async{
  try {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
return credential.user;
}
catch (e){
print("Erro");
}
return null;
}


Future<User?> signInWithEmailAndPassword(String email, String password) async{
  try {
    UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
return credential.user;
}
catch (e){
print("Erro $e");
}
return null;
}

User? getCurrentUser(){
return _auth.currentUser;
}

 // Função para deletar o usuário do Firebase Auth e Firestore
  Future<void> deleteUser(String email) async {
    try {
      User? user = _auth.currentUser;
      
      // Deleta os dados no Firestore antes de remover a autenticação
      await deleteUserData(email);

      // Deleta a conta de autenticação
      if (user != null) {
        await user.delete();
        print("Conta deletada com sucesso.");
      } else {
        print("Usuário não está logado.");
      }
    } catch (e) {
      print("Erro ao deletar a conta: $e");
    }
  }

  // Função para deletar os dados do usuário no Firestore
  Future<void> deleteUserData(String email) async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('Usuarios')
          .where('email', isEqualTo: email)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
      print("Dados do usuário deletados do Firestore.");
    } catch (e) {
      print("Erro ao deletar os dados no Firestore: $e");
    }
  }
}
