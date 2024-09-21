import 'package:flutter/material.dart';
import 'package:quiz/components/button.dart';
import 'package:quiz/components/customText.dart';
import 'package:quiz/screens/baseScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo de imagem
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Formulário
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                color: Color.fromARGB(155, 14, 12, 12),
              ),
              child:  const SingleChildScrollView(
                // Adicione este widget para evitar overflow
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Use MainAxisSize.min para que a coluna não ocupe todo o espaço
                  children: [
                    CustomTextField(icon: Icons.person, label: 'Nome Completo'),
                    CustomTextField(icon: Icons.email, label: 'E-mail'),
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Confirme a senha',
                      isSecret: true,
                    ),
                    SizedBox(
                        height: 50), // Espaçamento abaixo do campo de senha
                    Button(
                      width: 200,
                      color: Color(0xFFC11357),
                      text: 'Logar',
                      textButtonColor: Colors.white,
                      route: BaseScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
