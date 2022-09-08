import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  BackGroundImage({
  required this.child,
  }) : super();
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fitWidth,
          ),
          color: Colors.black,
        ),
        child: child,
    );
  }
}
