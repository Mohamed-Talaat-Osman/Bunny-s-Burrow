import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  GestureTapCallback onTap;
  Color color;
  Widget child;

  DefaultButton({
    required this.onTap,
    required this.color,
    required this.child,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}
