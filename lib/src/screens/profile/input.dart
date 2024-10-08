import 'package:flutter/material.dart';

Widget dateProfile( {required String label, required String date}) {
  bool isEnabled = false;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      const SizedBox(height: 8,),
    TextFormField(
      enabled: isEnabled,
      initialValue: date,
      decoration: InputDecoration(
        
         focusedBorder: OutlineInputBorder(
            borderSide:  const BorderSide(color: Colors.white, width: 0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.2),
            borderRadius: BorderRadius.circular(15),
          ),
           disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.2), // Borda quando inativo
            borderRadius: BorderRadius.circular(15),
          ),
      ),
    ),
        const SizedBox(height: 25,)
    ],
  );
}
