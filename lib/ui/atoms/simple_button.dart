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
    const height = 70.0;
    final size = MediaQuery.of(context).size;
    final double fontSize =
        size.height > 1200 ? size.height / 70 : size.height / 50;

    final double padding =
        size.height > 1200 ? size.height / 100 : size.height / 80;

    final widthContent = MediaQuery.of(context).size.aspectRatio > 0.7
        ? size.height * 0.8
        : size.width;

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
        child: Container(
          width:
              widthContent < size.width ? widthContent / 3.5 : widthContent / 2,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.white,
              side: const BorderSide(
                color: AppTheme.white,
                width: 0.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            ),
            onPressed: widget.onPressed,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                widget.lable,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
