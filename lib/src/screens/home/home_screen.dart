import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';
import 'package:quiz/src/screens/home/components/widget_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customContrastColor, // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: CustomColors.customContrastColor, // Cor do AppBar
        elevation: 0.0, // Sem sombra
        automaticallyImplyLeading: false, // Remove a seta de voltar
        title: SafeArea(
          child: Center(
            child: Image.asset(
              'lib/assets/images/danzify.png', height: 120, // Altura da imagem
              fit: BoxFit.contain,
            ),
          ),
        ), // Ajuste dentro do AppBar),
       
        
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: CustomColors.customContrastColor, // Cor sólida para garantir que o fundo não mude
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15, left: 10),
        child: ListView(
          children: [
            titleListView(context, 'Continue Assistindo'),
      ListCardHorizontal(sectionTitle: 'Continue Assistindo'), // Chamando a função dos cards para a mesma seção
            titleListView(context, 'Melhores Avaliados'),
      ListCardHorizontal(sectionTitle: 'Melhores Avaliados'), // Chamando a função dos cards para a mesma seção
            titleListView(context, 'Adicionados Recentemente'),
      ListCardHorizontal(sectionTitle: 'Adicionadas Recentemente'), // Chamando a função dos cards para a mesma seção
            titleListView(context, 'Mais Vistas'),
      ListCardHorizontal(sectionTitle: 'Mais Vistas'), // Chamando a função dos cards para a mesma seção
          ],
        ),
      ),
    );
  }
}
