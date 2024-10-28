import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/screens/profile/input.dart';
import 'package:quiz/src/services/auth_service.dart';
import 'package:quiz/src/services/database_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Acesso ao serviço de autenticação

String nome = '';
String email = '';
String telefone = '';

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData;
  }

  Future<void> _loadUserData() async{
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Map<String, dynamic>? userData = await getUserData(uid);

  // Atualiza o estado com os dados do usuário ou exibe uma mensagem de erro.
  setState(() {
    if (userData != null) {
      nome = userData['nome'] ?? '';
      telefone = userData['telefone']?.toString() ?? '';
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar dados do usuário.')),
      );
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A), // Cor do AppBar
        elevation: 0.0, // Sem sombra
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Perfil',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0A0A0A), // Cor sólida para garantir que o fundo não mude
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/assets/images/'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20),
              child: Center(
                child: Text(
                  // Exibe o nome do usuário, se disponível, ou um texto padrão
                 nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            // Exibe o e-mail do usuário autenticado
            dateProfile(label: 'E-mail', date: email),
            // Exibe o telefone, se disponível. Você pode buscar isso do Firestore ou outro local
            dateProfile(label: 'Telefone', date: telefone), // Altere para obter do Firebase se necessário
          ],
        ),
      ),
    );
  }
}
