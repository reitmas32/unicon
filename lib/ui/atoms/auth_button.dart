import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Button Auth
class AuthButton extends StatelessWidget {
  ///  Contructor
  const AuthButton({super.key, required this.label, required this.onPress});

  /// lable of button
  final String label;

  /// Callback of Button
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor:
            Colors.black, // Cambia el color del texto según tus necesidades
      ),
      child: SizedBox(
        height: size.height / 30,
        child: AutoSizeText(
          label,
          style: GoogleFonts.jetBrainsMono(
            color: Colors.white,
            fontSize: size.height / 30,
            fontWeight: FontWeight.w100,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
