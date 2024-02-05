import 'package:flutter/material.dart';
import 'package:unicon/domain/core/settings.dart';

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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(settings.BACK_GROUND_IMG),
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
