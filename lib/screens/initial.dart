import 'package:flutter/material.dart';
import 'package:quiz/components/button.dart';
import 'package:quiz/screens/auth/login.dart';

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
                  fit: BoxFit.cover),
            ),
            child: const Align(
              alignment: Alignment(0.0, 0.4),
              child: Button(
                route: Login(),
                color: Colors.white,
                text: 'Entrar',
                textButtonColor: Color(0xFFC11357),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
