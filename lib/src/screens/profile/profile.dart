import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/screens/profile/input.dart';
import 'package:quiz/src/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Acesso ao serviço de autenticação
  AuthService auth = AuthService();
  User? user;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  // Método para carregar os dados do usuário autenticado
  void loadUserData() {
    setState(() {
      user = auth.getCurrentUser();
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
                backgroundImage: AssetImage('lib/assets/images/nenem.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20),
              child: Center(
                child: Text(
                  // Exibe o nome do usuário, se disponível, ou um texto padrão
                  user?.displayName ?? 'Nome não disponível',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            // Exibe o e-mail do usuário autenticado
            dateProfile(label: 'E-mail', date: user?.email ?? 'E-mail não disponível'),
            // Exibe o telefone, se disponível. Você pode buscar isso do Firestore ou outro local
            dateProfile(label: 'Telefone', date: '(21) 97648-2118'), // Altere para obter do Firebase se necessário
          ],
        ),
      ),
    );
  }
}
