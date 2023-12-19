import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/providers/theme.dart';

class SimpleButton extends StatefulWidget {
  const SimpleButton({
    super.key,
    this.lable = 'SimpleButton',
    this.onPressed,
  });

  final String lable;
  final VoidCallback? onPressed;

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    const width = 200.0;
    const height = 300.0;
    final size = MediaQuery.of(context).size;
    final double fontSize =
        MediaQuery.of(context).size.aspectRatio > 1.4 ? 50 : 30;
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
                1.0,
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.lable,
              style: GoogleFonts.jetBrainsMono(
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
