import 'package:flutter/material.dart';
import 'package:quiz/src/components/search/widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A), // Cor do AppBar
        elevation: 0.0, // Sem sombra
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Pesquisar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(
                0xFF0A0A0A), // Cor sólida para garantir que o fundo não mude
          ),
        ),
      ),
      //
      body: Container(
        padding: const EdgeInsets.all(16.0), // Espaço ao redor do TextField
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SafeArea(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Procure suas danças favoritas...',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 165, 165, 165)),
                  fillColor: const Color(0xFF211f24), // Cor de fundo
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Arredondamento das bordas
                    borderSide: BorderSide.none, // Sem borda visível
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Arredondamento das bordas
                    borderSide:
                        BorderSide.none, // Sem borda visível quando inativo
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Arredondamento das bordas
                    borderSide:
                        BorderSide.none, // Sem borda visível quando ativo
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Text(
                  'Categorias',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(child: verticalListCategories())
          ],
        ),
      ),
    );
  }
}
