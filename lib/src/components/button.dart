import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final Color textButtonColor;
  final Widget route;
  final double width;
  const Button({super.key, required this.color, required this.text, required this.textButtonColor, required this.route, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => route));            
},
      child: Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
           boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // Cor da sombra com transparência
              spreadRadius: 2, // Extensão da sombra
              blurRadius: 6, // Desfoque da sombra
              offset: const Offset(0, 3), // Deslocamento da sombra (x, y)
            ),
          ],
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
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
