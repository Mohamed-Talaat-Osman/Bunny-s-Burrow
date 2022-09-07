import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  String text;
  Color color;
  double size;

  BoldText({
    required this.text,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
