import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: CustomColors.customContrastColor, // Cor de fundo do Scaffold
      appBar: AppBar(
          backgroundColor: CustomColors.customContrastColor, // Cor do AppBar
          elevation: 0.0, // Sem sombra
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Favoritos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nexa',
                fontSize: 30,
              ),
            ),
          )), //
   body: Container(
    child: const Row(
      children: [],
    ),
   ), );
  }
}