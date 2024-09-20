import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatter,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: widget.inputFormatter,
        obscureText: widget.isSecret, // Controle de senha secreta
        decoration: InputDecoration(
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                )
              : null,
          prefixIcon: Icon(widget.icon),
          isDense: true,
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.grey), // Cor do rótulo fora
          hintStyle: TextStyle(color: Colors.blue), // Cor do texto dentro
          filled: true,
          fillColor: Color.fromARGB(255, 255, 250, 250),
          
         focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent), // Remove a borda ao focar
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent), // Remove a borda quando habilitado
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
