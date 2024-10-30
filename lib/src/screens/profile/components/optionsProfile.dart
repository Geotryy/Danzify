import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionsProfile extends StatelessWidget {
  const OptionsProfile({
    super.key,
    required this.route,
    required this.description,
    required this.icon,
  });
  final Widget route;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
