import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController controller; // Controller para gerenciar o texto
  final String? errorText;
  final TextInputType keyboardType;

  const CustomTextField(
      {super.key,
      required this.icon,
      required this.label,
      this.isSecret = false,
      this.inputFormatter,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.errorText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatter,
        obscureText: isObscure, // Use 'isObscure' em vez de 'widget.isSecret'
        decoration: InputDecoration(
          errorText: widget.errorText,
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                )
              : null,
          prefixIcon: Icon(widget.icon),
          isDense: true,
          hintText: widget.label, // Usando hintText em vez de labelText
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 250, 250),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            // Borda quando há um erro
            borderSide: const BorderSide(
                color: Colors.red), // Defina a cor da borda de erro
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // Borda quando o campo está focado e há um erro
            borderSide: const BorderSide(
                color: Colors.red), // Defina a cor da borda de erro focada
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
