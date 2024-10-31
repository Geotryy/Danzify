import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionsProfile extends StatelessWidget {
  const OptionsProfile({
    super.key,
    required this.navigator,
    required this.description,
    required this.icon,
  });
  final void Function (BuildContext) navigator;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigator(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(10),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(59, 70, 69, 69)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
           const SizedBox(
              width: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'Nexa',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
