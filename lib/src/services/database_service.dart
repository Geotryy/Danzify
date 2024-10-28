import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> signUpFirestore( String nome, int telefone, String email) async {
  var collection = FirebaseFirestore.instance.collection('Usuarios');
  await collection.add({
    'nome': nome,
    'telefone': telefone,
    'email': email
  });
}

Future<Map<String, dynamic>?> getUserData(String uid) async{
  var docRef = FirebaseFirestore.instance.collection('Usuarios').doc(uid);
 var snapshot = await docRef.get();

   // Verifica se o documento existe
  if (snapshot.exists) {
    return snapshot.data(); // Retorna os dados como um mapa
  } else {
    print("Documento não encontrado para o uid: $uid");
    return null;
  }
}

