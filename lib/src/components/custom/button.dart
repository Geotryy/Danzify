import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textButtonColor;
  final double width;
  final VoidCallback? onPressed; // O onPressed também é opcional
  final void Function (BuildContext)? navigator;
  const CustomButton({
    super.key,
    required this.color,
    required this.text,
    required this.textButtonColor,
    required this.width,
    required this.navigator,
    this.onPressed, // Não obrigatório
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else if (navigator != null) {
                    navigator!(context); // Chama a função de navegação

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
