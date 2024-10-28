import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';
import 'package:quiz/src/components/search/map_categ.dart';

Widget verticalListCategories() {
  List<String> categoryNames = categories.keys.toList();
  return GridView.builder(
    padding: const EdgeInsets.all(16.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // 2 colunas por linha
      crossAxisSpacing: 15.0, // Espaçamento horizontal entre os containers
      mainAxisSpacing: 15.0, // Espaçamento vertical entre os containers
      childAspectRatio:
          1.5, // Controla a proporção largura/altura dos containers
    ),
    itemCount: categoryNames.length, // Total de categorias
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          color: CustomColors.getColor(50),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            categoryNames[index],
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}

Widget horizontalListCategories() {
  List<String> categoryNames = categories.keys.toList();
  return Container(
    margin: const EdgeInsets.all(16),
    width: double.infinity,
    child: ListView.builder(
        itemCount: categoryNames.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 80,
            child: Card(
              color: CustomColors.getColor(50),
              child: Center(
                child: Text(
                  categoryNames[index],
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          );
        }),
  );
}
