import 'package:flutter/material.dart';

Widget titleListView(context, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
  );
}

Widget listCardHorizontal() {
  return Container(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          width: 140,
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Teste',
                    style: TextStyle(fontSize: 16),
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
