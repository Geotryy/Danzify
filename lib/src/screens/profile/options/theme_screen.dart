import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/components/colors/colors.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

bool _lights = false;

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          CustomColors.customContrastColor, // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: CustomColors.customContrastColor, // Cor do AppBar
        elevation: 0.0, // Sem sombra
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Aparência',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: CustomColors
                .customContrastColor, // Cor sólida para garantir que o fundo não mude
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text(
                'Tema escuro',
                style: TextStyle(),
              ),
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
              secondary: const Icon(CupertinoIcons.lightbulb),
            )
          ],
        ),
      ),
    );
  }
}
