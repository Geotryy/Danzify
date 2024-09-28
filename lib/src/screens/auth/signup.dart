import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/components/auth/custom_text.dart';
import 'package:quiz/src/components/custom/button.dart';


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
    txtNome.dispose();
    txtEmail.dispose();
    txtSenha.dispose();
    super.dispose();
  }

  String? senhaError;

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
                    CustomTextField(
                        icon: Icons.person,
                        label: 'Nome Completo',
                        controller: txtNome),
                    CustomTextField(
                        icon: Icons.email,
                        label: 'E-mail',
                        controller: txtEmail),
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      controller: txtSenha,
                      errorText: senhaError,
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
    String name = txtNome.text.trim(); // Remove espaços extras
    String email = txtEmail.text.trim();
    String senha = txtSenha.text.trim();

    if (name.isEmpty || email.isEmpty || senha.isEmpty) {
      // Verificar se os campos estão vazios
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Preencha todos os campos.'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    setState(() {
      senhaError = null;
    });

    if (senha.length < 6) {
      setState(() {
        senhaError = "A senha deve conter pelo menos 6 dígitos";
      });
    }

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, senha);

      if (user != null) {
        await user.updateDisplayName(name); // Atualiza o nome de exibição
        await user.reload(); // Recarrega o usuário para aplicar a mudança

        User? updatedUser =
            _auth.getCurrentUser(); // Obtém o usuário atualizado
        print("Usuário cadastrado com nome: ${updatedUser?.displayName}");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BaseScreen()));
      }
    } catch (e) {
      print("Erro ao cadastrar: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Erro ao cadastrar. Tente novamente.'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
