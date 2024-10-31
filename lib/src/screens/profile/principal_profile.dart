import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';
import 'package:quiz/src/screens/auth/sign_in.dart';
import 'package:quiz/src/screens/initial/initial_screen.dart';
import 'package:quiz/src/screens/profile/components/options_profile.dart';
import 'package:quiz/src/screens/profile/options/profile_screen.dart';
import 'package:quiz/src/screens/profile/options/security_screen.dart';
import 'package:quiz/src/screens/profile/options/theme_screen.dart';
import 'package:quiz/src/services/database_service.dart';
import 'package:flutter/cupertino.dart';

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
              fontFamily: 'Nexa',
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
        child: Column(
          children: [
           Stack(
            children: [
             const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('lib/assets/images/profile.jfif'),
                ),
              ),
              Positioned(
                bottom: 0,
                right: MediaQuery.of(context).size.width * 0.35,
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Color(0xFFC11357),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
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
                    fontFamily: 'Nexa',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView(
                children: [
// TELA DE DADOS PESSOAIS
                  OptionsProfile(
                      navigator: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      description: 'Dados Pessoais',
                      icon: CupertinoIcons.person),

// TELA DE SEGURANCA
                  OptionsProfile(
                      navigator: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecurityScreen(),
                          ),
                        );
                      },
                      description: 'Segurança',
                      icon: CupertinoIcons.lock),
// TELA DE APARENCIA
                  OptionsProfile(
                      navigator: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThemeScreen(),
                          ),
                        );
                      },
                      description: 'Aparência',
                      icon: CupertinoIcons.paintbrush),
// TELA DE SAIR
                  OptionsProfile(
                      navigator: (context) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstScreen(),
                            ),
                            (route) => false);
                      },
                      description: 'Sair',
                      icon: CupertinoIcons.square_arrow_right),
// TELA DE APAGAR CONTA
                  OptionsProfile(
                      navigator: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FirstScreen(),
                          ),
                        );
                      },
                      description: 'Apagar a conta',
                      icon: CupertinoIcons.trash),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
