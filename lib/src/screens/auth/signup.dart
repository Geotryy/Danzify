import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/components/button.dart';
import 'package:quiz/src/components/custom_text.dart';
import 'package:quiz/src/screens/base/base.dart';
import 'package:quiz/src/services/auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final txtNome = TextEditingController();
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();
  
@override
  void dispose() {
  txtEmail.dispose();
  txtSenha.dispose();
    // TODO: implement dispose
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
                   
                    const SizedBox(
                        height: 50), // Espaçamento abaixo do campo de senha
                     Button(
                      width: 200,
                      color: Color(0xFFC11357),
                      text: 'Cadastrar',
                      textButtonColor: Colors.white,
                      onPressed: _signUp,
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
void _signUp() async {
String name = txtNome.text;
String email = txtEmail.text;
String senha = txtSenha.text;

User? user = await _auth.signUpWithEmailAndPassword(email, senha);

if (user != null){
  print("Usuário cadastrado");
Navigator.push(context, (MaterialPageRoute(builder: (context) => BaseScreen())));
}
}
}
