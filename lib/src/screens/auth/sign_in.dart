import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/screens/auth/components/auth/custom_text.dart';
import 'package:quiz/src/components/custom/button.dart';
import 'package:quiz/src/screens/base/base.dart';
import 'package:quiz/src/services/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();

  @override
  void dispose() {
    txtEmail.dispose();
    txtSenha.dispose();
    super.dispose();
  }

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
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45)),
                  color: Color.fromARGB(155, 14, 12, 12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Use MainAxisSize.min para que a coluna não ocupe todo o espaço
                  children: [
                    CustomTextField(
                      icon: Icons.email,
                      label: 'E-mail',
                      controller: txtEmail,
                    ),
                  
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      controller: txtSenha,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: Colors.white, fontSize: 15,),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 30), // Espaçamento abaixo do campo de senha
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: CustomButton(
                        width: 200,
                        color: const Color(0xFFC11357),
                        text: 'Logar',
                        textButtonColor: Colors.white,
                        onPressed: _signIn,
                        navigator: (context) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BaseScreen()),
                              (route) => false);
                        },
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

  void _signIn() async {
    String email = txtEmail.text;
    String senha = txtSenha.text;

    User? user = await _auth.signInWithEmailAndPassword(email, senha);

    if (user != null) {
      Navigator.push(
          context, (MaterialPageRoute(builder: (context) => BaseScreen())));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(
            child: (Text('Insira seus dados')),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
