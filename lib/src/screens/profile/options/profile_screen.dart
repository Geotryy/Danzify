import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';
import 'package:quiz/src/components/custom/button.dart';
import 'package:quiz/src/screens/profile/components/data_profile.dart';
import 'package:quiz/src/screens/profile/options/edit-profile.dart';
import 'package:quiz/src/services/database_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return PopScope(
      canPop: true,
      child: Scaffold(
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('lib/assets/images/profile.jfif'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DataProfile(label: 'Nome', data: nome),
              // Exibe o e-mail do usuário autenticado
              DataProfile(label: 'E-mail', data: email),

              DataProfile(label: 'Telefone', data: telefone),
              SizedBox(
                child: CustomButton(
                  color: CustomColors.customSwatchColor,
                  text: "Editar Perfil",
                  textButtonColor: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.5,
                   navigator: (context) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
                        },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
