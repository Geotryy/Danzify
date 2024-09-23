import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      // Container de fundo
      Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 12, 11, 11),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25,
                  ), // Cor do ícone
                  SizedBox(width: 8), // Espaçamento entre o ícone e o texto
                  Text(
                    'Hello, Geo!',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Container branco
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: ListView(children: [Container()])))
    ]));
  }
}
