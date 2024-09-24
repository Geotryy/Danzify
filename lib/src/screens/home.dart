import 'package:flutter/material.dart';
import 'package:quiz/src/components/home/widget_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A), // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0A0A), // Cor do AppBar
        elevation: 0.0, // Sem sombra
        automaticallyImplyLeading: false, // Remove a seta de voltar
        title: Image.asset(
          'lib/assets/images/danzify.png', height: 80, // Altura da imagem
          fit: BoxFit.contain,
        ), // Ajuste dentro do AppBar),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.circle),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(
                0xFF0A0A0A), // Cor sólida para garantir que o fundo não mude
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 10),
        child: ListView(
          children: [
            titleListView(context, 'Continue Assistindo'),
            listCardHorizontal(),
            titleListView(context, 'Mais Vistos'),
            listCardHorizontal(),
            titleListView(context, 'Adicionados Recentemente'),
            listCardHorizontal(),
            titleListView(context, 'Melhores Avaliados'),
            listCardHorizontal(),
          ],
        ),
      ),
    );
  }
}
