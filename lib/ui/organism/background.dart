import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.gif'),
              fit: BoxFit.cover, // Para cubrir toda la pantalla
            ),
          ),
        ),
        //
        child,
      ],
    );
  }
}
