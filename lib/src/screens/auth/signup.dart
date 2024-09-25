import 'package:flutter/material.dart';
import 'package:quiz/src/components/button.dart';
import 'package:quiz/src/components/auth/custom_text.dart';
import 'package:quiz/src/screens/base/base.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final txtNome = TextEditingController();
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();
  

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
              child: SingleChildScrollView(
                // Adicione este widget para evitar overflow
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Use MainAxisSize.min para que a coluna não ocupe todo o espaço
                  children: [
                    CustomTextField(icon: Icons.person, label: 'Nome Completo', controller: txtNome,),
                    CustomTextField(icon: Icons.email, label: 'E-mail', controller: txtEmail,),
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      controller: txtSenha,
                    ),
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Confirme a senha',
                      isSecret: true,
                      controller: txtSenha,
                    ),
                    const SizedBox(
                        height: 50), // Espaçamento abaixo do campo de senha
                    const Button(
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
