import 'package:flutter/material.dart';

Widget verticalListCategories() {
  return SizedBox(
    
    width: 415,
    child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 170,
                height: 100,
                child: Card(),
                margin: EdgeInsets.only(right: 15),
              ),
              Container(
                width: 170,
                height: 100,
               
                child: Card(),
              )
            ],
          );
        }),
  );
}
