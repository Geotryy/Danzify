import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/components/auth/custom_text.dart';
import 'package:quiz/src/components/custom/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final txtNumber = TextEditingController();

  String? senhaError;

  @override
  void dispose() {
    txtNome.dispose();
    txtEmail.dispose();
    txtSenha.dispose();
    txtNumber.dispose();
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      icon: Icons.person,
                      label: 'Nome Completo',
                      controller: txtNome,
                    ),
                    CustomTextField(
                      icon: Icons.phone,
                      label: 'Telefone',
                      keyboardType: TextInputType.phone,
                      controller: txtNumber,
                    ),
                    CustomTextField(
                      icon: Icons.email,
                      label: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      controller: txtEmail,
                    ),
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      controller: txtSenha,
                      errorText: senhaError,
                    ),
                    const SizedBox(height: 50),
                    Button(
                      width: 200,
                      color: const Color(0xFFC11357),
                      text: 'Cadastrar',
                      textButtonColor: Colors.white,
                      onPressed: _signUp,
                    ),
                    Button(
                      width: 200,
                      color: const Color(0xFFC11357),
                      text: 'Testar Firestore',
                      textButtonColor: Colors.white,
                      onPressed: testFirestore, // Chame o método ao pressionar
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
    String nome = txtNome.text.trim();
    String email = txtEmail.text.trim();
    String senha = txtSenha.text.trim();
    String phone = txtNumber.text.trim();

    if (nome.isEmpty || email.isEmpty || senha.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos.'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Retorna aqui para evitar continuar se os campos estiverem vazios
    }

    setState(() {
      senhaError = null;
    });

    if (senha.length < 6) {
      setState(() {
        senhaError = "A senha deve conter pelo menos 6 dígitos";
      });
      return; // Retorna aqui para evitar continuar se a senha for inválida
    }

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, senha);

      if (user != null) {
        await user.updateDisplayName(nome);
       FirebaseFirestore.instance
    .collection('usuarios')
    .doc(user.uid)  // Definindo o UID como ID do documento
    .set({
      'Nome': txtNome.text,
      'Email': txtEmail.text,
      'Telefone': txtNumber.text,
      'Senha': txtSenha.text
    });
        
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const BaseScreen()),
        );
      }
    } catch (e) {
      print("Erro ao cadastrar: ${e.toString()}");
      String errorMessage = "Erro ao cadastrar. Tente novamente.";
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
    }
  }

  void testFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('test')
          .doc('testUser')
          .set({'testField': 'testValue'});
      print("Gravação bem-sucedida!");
    } catch (e) {
      print("Erro ao gravar no Firestore: ${e.toString()}");
    }
  }
}
