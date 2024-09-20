import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
            color: Color(0xFFC11357),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(child: Text('Logar', style: TextStyle(fontSize: 17, color: Colors.white),),),
      ),
    );
  }
}
