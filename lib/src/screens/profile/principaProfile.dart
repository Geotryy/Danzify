import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';
import 'package:quiz/src/screens/profile/components/optionsProfile.dart';
import 'package:quiz/src/screens/profile/profileScreen.dart';
import 'package:quiz/src/services/database_service.dart';

class PrincipalProfile extends StatefulWidget {
  const PrincipalProfile({super.key});

  @override
  State<PrincipalProfile> createState() => _PrincipalProfileState();
}

class _PrincipalProfileState extends State<PrincipalProfile> {
  String nome = '';
  String email = '';
  String telefone = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      // Obtem o email do usuário autenticado
      String? email = FirebaseAuth.instance.currentUser?.email;

      if (email != null) {
        // Obtém os dados do Firestore
        Map<String, dynamic>? userData = await getUserData(email);

        setState(() {
          if (userData != null) {
            nome = userData['nome'] ?? '';
            telefone = userData['telefone']?.toString() ?? 'nao foi';
            this.email =
                userData['email'] ?? 'nao foi'; // Atualiza o email do estado
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Erro ao carregar dados do usuário.')),
            );
          }
        });
      }
    } catch (e) {
      print("Erro ao carregar dados: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          CustomColors.customContrastColor, // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: CustomColors.customContrastColor, // Cor do AppBar
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
          decoration: BoxDecoration(
            color: CustomColors
                .customContrastColor, // Cor sólida para garantir que o fundo não mude
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
                backgroundImage: AssetImage('lib/assets/images/profile.jfif'),
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
            ListView(
              children: const [
                    OptionsProfile(route: ProfileScreen, description: 'Dados Pessoais', icon: Icons.person)
            ],
            )
          ],
        ),
      ),
    );
  }
}
