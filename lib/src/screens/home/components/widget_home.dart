import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';

Widget titleListView(context, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Nexa', fontWeight: FontWeight.w600),
    ),
  );
}

Widget listCardHorizontal() {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 140,
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: CustomColors.getColor(50),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Teste',
                    style: TextStyle(fontSize: 16, fontFamily: 'Nexa', fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
