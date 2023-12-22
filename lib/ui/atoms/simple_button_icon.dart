import 'package:flutter/material.dart';
import 'package:unicon/ui/providers/theme.dart';

class SimpleIconButton extends StatefulWidget {
  const SimpleIconButton({
    super.key,
    this.icon = const Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
    this.onPressed,
  });

  final Icon icon;
  final VoidCallback? onPressed;

  @override
  State<SimpleIconButton> createState() => _SimpleIconButtonState();
}

class _SimpleIconButtonState extends State<SimpleIconButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    const width = 50.0;
    const height = 50.0;

    return MouseRegion(
      onEnter: (event) => setState(() {
        isHover = true;
      }),
      onExit: (event) => setState(() {
        isHover = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Duración de la animación
        curve: Curves.easeInOut, // Curva de la animación
        transform: isHover
            ? (Matrix4.identity()
              ..translate(-0.1 * width,
                  -0.1 * height) // translate towards right and down
              ..scale(1.2, 1.2))
            : Matrix4.identity(), // Aplica escala si está en hover
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.white,
            side: const BorderSide(
              color: AppTheme.white,
              width: 0.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}
