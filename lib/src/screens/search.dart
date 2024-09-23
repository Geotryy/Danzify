import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0), // Espaço ao redor do TextField
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            SafeArea(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Pesquisar...',
                  fillColor: const Color.fromARGB(255, 202, 197, 197), // Cor de fundo
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), // Arredondamento das bordas
                    borderSide: BorderSide.none, // Sem borda visível
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), // Arredondamento das bordas
                    borderSide: BorderSide.none, // Sem borda visível quando inativo
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), // Arredondamento das bordas
                    borderSide: BorderSide.none, // Sem borda visível quando ativo
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
