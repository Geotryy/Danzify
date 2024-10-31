import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';

import 'package:quiz/src/screens/search/components/widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});


  @override
  State<SearchScreen> createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
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
            'Pesquisar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nexa',
              fontSize: 30,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: CustomColors.customContrastColor, // Cor sólida para garantir que o fundo não mude
          ),
        ),
      ),
      //
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
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
                      fontFamily: 'Nexa',
                        color: Color.fromARGB(255, 165, 165, 165)),
                    fillColor: const Color(0xFF211f24), // Cor de fundo
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Arredondamento das bordas
                      borderSide: BorderSide.none, // Sem borda visível
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Arredondamento das bordas
                      borderSide:
                          BorderSide.none, // Sem borda visível quando inativo
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Arredondamento das bordas
                      borderSide:
                          BorderSide.none, // Sem borda visível quando ativo
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Text(
                    'Categorias',
                    style: TextStyle(
                      fontFamily: 'Nexa',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: orientation == Orientation.portrait
                    ? verticalListCategories()
                    : horizontalListCategories(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
