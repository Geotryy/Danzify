import 'package:flutter/material.dart';

Widget titleListView(BuildContext context, String sectionTitle) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      sectionTitle,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Nexa',
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class ListCardHorizontal extends StatefulWidget {
  final String sectionTitle;

  ListCardHorizontal({required this.sectionTitle});

  @override
  _ListCardHorizontalState createState() => _ListCardHorizontalState();
}

class _ListCardHorizontalState extends State<ListCardHorizontal> {
  // Controle do estado de expansão para cada item
  int? expandedIndex;

  void toggleExpand(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = sections[widget.sectionTitle] ?? [];

    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          bool isExpanded = expandedIndex == index;

          return GestureDetector(
            onTap: () => toggleExpand(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isExpanded ? 200.0 : 140.0,
              margin: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  // Imagem (usando Image.network para imagens da web)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  // Botão de favoritar e título (exibidos apenas quando expandido)
                  if (isExpanded)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          // Adicionar funcionalidade de favoritar aqui
                        },
                      ),
                    ),
                  if (isExpanded)
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Map<String, List<Map<String, String>>> sections = {
  'Continue Assistindo': [
    {'title': 'Cisne Negro', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
    {'title': 'O Lago dos Cisnes', 'image': 'https://petitedanse.com.br/wp-content/uploads/2018/01/escola-de-danca-petite-danse-dom-quixote-1877-3.jpg'},
    {'title': 'The Nutcrackers', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
    {'title': 'O Valsas das Flores', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
  ],
  'Melhores Avaliados': [
    {'title': 'Abertura de Gala de Aida', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
    {'title': 'Single Ladies - Beyoncé', 'image': 'https://s2.glbimg.com/FmHoDdMaz_Xg5GVgfLkNzPOOvJU=/s.glbimg.com/jo/g1/f/original/2013/09/10/beyonce.jpg'},
    {'title': 'The Nutcracker', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
    {'title': 'O Lago dos Cisnes', 'image': 'https://petitedanse.com.br/wp-content/uploads/2018/01/escola-de-danca-petite-danse-dom-quixote-1877-3.jpg'},
  ],
  'Adicionadas Recentemente': [
    {'title': 'A Dança das Horas', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
    {'title': 'Single Ladies - Beyoncé', 'image': 'https://s2.glbimg.com/FmHoDdMaz_Xg5GVgfLkNzPOOvJU=/s.glbimg.com/jo/g1/f/original/2013/09/10/beyonce.jpg'},
    {'title': 'Uptown Funk - Mark Ronson ft. Bruno Mars', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
    {'title': 'Bad Romance - Lady Gaga', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
    {'title': 'Shake It Off - Taylor Swift', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
  ],
  'Mais Vistas': [
    {'title': 'Single Ladies - Beyoncé', 'image': 'https://s2.glbimg.com/FmHoDdMaz_Xg5GVgfLkNzPOOvJU=/s.glbimg.com/jo/g1/f/original/2013/09/10/beyonce.jpg'},
    {'title': 'Thriller - Michael Jackson', 'image': 'https://www.bellaballroom.com/wp-content/uploads/2014/11/thriller-dance.png'},
    {'title': 'O Lago dos Cisnes', 'image': 'https://petitedanse.com.br/wp-content/uploads/2018/01/escola-de-danca-petite-danse-dom-quixote-1877-3.jpg'},
    {'title': 'Cisne Negro', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
    {'title': 'Shake It Off - Taylor Swift', 'image': 'https://i.pinimg.com/564x/1f/06/30/1f06305b8b564a4bc25e6f52dd96856a.jpg'},
  ],
};
