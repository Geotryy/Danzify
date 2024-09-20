import 'package:flutter/material.dart';
import 'package:quiz/screens/auth/login.dart';
import 'package:quiz/screens/home.dart';

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
            child: Align(
              alignment: Alignment(0.0, 0.4),
              child: SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
