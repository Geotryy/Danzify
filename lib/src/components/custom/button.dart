import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final Color textButtonColor;
  final Widget? route; // Agora o route é opcional
  final double width;
  final VoidCallback? onPressed; // O onPressed também é opcional

  const Button({
    super.key,
    required this.color,
    required this.text,
    required this.textButtonColor,
    this.route, // Não obrigatório
    required this.width,
    this.onPressed, // Não obrigatório
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else if (route != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route!), // Verifica se route foi passado
          );
        }
      },
      child: Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              color: textButtonColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
