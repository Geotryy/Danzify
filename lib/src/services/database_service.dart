import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> signUpFirestore( String nome, int telefone, String email) async {
  var collection = FirebaseFirestore.instance.collection('Usuarios');
  await collection.add({
    'nome': nome,
    'telefone': telefone,
    'email': email
  });
}


Future<Map<String, dynamic>?> getUserData(String email) async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection('Usuarios')
      .where('email', isEqualTo: email,)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first.data(); // Retorna o primeiro documento encontrado como mapa
  } else {
    print("Documento não encontrado para o email: $email");
    return null;
  }
}

