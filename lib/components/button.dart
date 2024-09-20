import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final Color textButtonColor;
  final Widget route;
  const Button({super.key, required this.color, required this.text, required this.textButtonColor, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => route));            
},
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 17, color: textButtonColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
