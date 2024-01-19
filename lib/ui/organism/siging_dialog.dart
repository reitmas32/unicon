import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/atoms/google_sigin_button.dart';
import 'package:unicon/ui/providers/theme.dart';

class SigInDialog extends StatelessWidget {
  const SigInDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      content: SizedBox(
        width: size.width / 4.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/unicon.svg",
              height: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Log In",
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not yet a member ",
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign up",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppTheme.darkPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "User",
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius
                            .zero, // O cualquier otro radio que desees
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Password",
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius
                            .zero, // O cualquier otro radio que desees
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'o',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: GoogleSignInButton(),
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: Colors.white, // Color del borde
          width: 1.0, // Grosor del borde
        ),
      ),
      backgroundColor: Colors.black,
      actions: [
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppTheme.purple.withAlpha(30), // Color del fondo del botón
            foregroundColor: Colors.white, // Color del texto del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Bordes cuadrados
              side: BorderSide(
                  color: AppTheme.purple.withAlpha(30),
                  width: 1.0), // Borde blanco
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Cierra el diálogo
          },
          child: const Text(
            'Cancel',
          ),
        ),
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.purple, // Color del fondo del botón
            foregroundColor: Colors.black, // Color del texto del botón
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Bordes cuadrados
              side: BorderSide(color: Colors.black, width: 1.0), // Borde blanco
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Cierra el diálogo
          },
          child: const Text(
            'Confirm',
          ),
        ),
      ],
    );
  }
}
