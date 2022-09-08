import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  String text;
  Color color;
  double size;

  RegularText({
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
      ),
    );
  }
}
