import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFF0A0A0A), // Cor de fundo do Scaffold
      appBar: AppBar(
          backgroundColor: const Color(0xFF0A0A0A), // Cor do AppBar
          elevation: 0.0, // Sem sombra
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Favoritos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          )), //
   body: Container(
    child: Row(
      children: [],
    ),
   ), );
  }
}