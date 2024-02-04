import 'package:flutter/material.dart';

/// Background Widget
class BackGroundWidget extends StatelessWidget {
  /// Contructor
  const BackGroundWidget({
    super.key,
    required this.child,
  });

  /// The [child] contained by the Background.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
