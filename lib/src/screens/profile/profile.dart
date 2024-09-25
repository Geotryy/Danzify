import 'package:flutter/material.dart';
import 'package:quiz/src/screens/profile/input.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // Cor de fundo do Scaffold
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A), // Cor do AppBar
        elevation: 0.0, // Sem sombra
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Perfil',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(
                0xFF0A0A0A), // Cor sólida para garantir que o fundo não mude
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/assets/images/nenem.jpg'),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: Center(
                  child: Text(
                    'Arthur Tolentino',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )),
            dateProfile(label: 'E-mail', date: 'arthur@gmail.com'),
            dateProfile(label: 'Telefone', date: '(21) 97648-2118'),
          ],
        ),
      ),
    ); //
  }
}
