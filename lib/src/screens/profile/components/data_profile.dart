import 'package:flutter/material.dart';

class DataProfile extends StatefulWidget {
  final String label;
  final String data;
  const DataProfile({super.key, required this.label, required this.data});

  @override
  State<DataProfile> createState() => _DataprofileState();
}

class _DataprofileState extends State<DataProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 0.1)),
            child: Text(
              widget.data,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ]);
  }
}
