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
              image: NetworkImage(
                  'https://raw.githubusercontent.com/reitmas32/unicon/main/assets/background.png'),
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
