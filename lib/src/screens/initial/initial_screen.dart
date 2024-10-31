import 'package:flutter/material.dart';
import 'package:quiz/src/components/custom/button.dart';
import 'package:quiz/src/screens/auth/sign_in.dart';
import 'package:quiz/src/screens/auth/sign_up.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza na tela
              children: [
                Spacer(flex:3),
                CustomButton(
                  width: 170,
                 navigator: (context) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                  color: Colors.white,
                  text: 'Inscrever-se',
                  textButtonColor: Color(0xFFC11357),
                ),
                SizedBox(height: 15),
                CustomButton(
                  width: 170,
                   navigator: (context) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                      },
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
