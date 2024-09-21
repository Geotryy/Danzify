import 'package:flutter/material.dart';
import 'package:quiz/components/button.dart';
import 'package:quiz/screens/auth/login.dart';
import 'package:quiz/screens/auth/signup.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/initial.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza na tela
              children: [
                Spacer(flex:3),
                Button(
                  width: 170,
                  route: SignUp(),
                  color: Colors.white,
                  text: 'Inscrever-se',
                  textButtonColor: Color(0xFFC11357),
                ),
                SizedBox(height: 15),
                Button(
                  width: 170,
                  route: Login(),
                  color: Color(0xFFC11357),
                  text: 'Entrar',
                  textButtonColor: Colors.white,
                ),
                Spacer(flex: 1,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
