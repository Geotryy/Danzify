import 'package:flutter/material.dart';
import 'package:quiz/components/button.dart';
import 'package:quiz/components/customText.dart';
import 'package:quiz/screens/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                color: Color.fromARGB(155, 14, 12, 12),
              ),
              child: const SingleChildScrollView( // Adicione este widget para evitar overflow
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Use MainAxisSize.min para que a coluna não ocupe todo o espaço
                  children: [
                    CustomTextField(icon: Icons.email, label: 'E-mail'),
                    SizedBox(height: 16), // Espaçamento entre os campos
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    SizedBox(height: 60), // Espaçamento abaixo do campo de senha
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: Button(
                        color: Color(0xFFC11357),
                        text: 'Logar',
                        textButtonColor: Colors.white,
                        route: HomeScreen(),
                      ),
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
