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
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor:
            Colors.black, // Cambia el color del texto según tus necesidades
      ),
      child: Text(
        label,
        style: GoogleFonts.jetBrainsMono(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
