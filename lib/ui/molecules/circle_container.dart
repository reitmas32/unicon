import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final double radius;
  final Color color;

  const CircleContainer(this.radius, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
