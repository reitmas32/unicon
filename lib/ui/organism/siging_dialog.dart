import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/atoms/google_sigin_button.dart';
import 'package:unicon/ui/providers/theme.dart';

/// SigInDialog
class SigInDialog extends StatelessWidget {
  /// Constructor
  const SigInDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AlertDialog(
      content: SizedBox(
        width: size.width / 4.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              'assets/unicon.svg',
              height: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Log In',
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
              children: <Widget>[
                Text(
                  'Not yet a member ',
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign up',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'User',
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
                        ),
                        borderRadius: BorderRadius
                            .zero, // O cualquier otro radio que desees
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Password',
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
                        ),
                        borderRadius: BorderRadius
                            .zero, // O cualquier otro radio que desees
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
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
                children: <Widget>[
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
        side: BorderSide(
          color: Colors.white, // Color del borde
        ),
      ),
      backgroundColor: Colors.black,
      actions: <Widget>[
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppTheme.purple.withAlpha(30), // Color del fondo del botón
            foregroundColor: Colors.white, // Color del texto del botón
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppTheme.purple.withAlpha(30),
              ), // Borde blanco
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
              side: BorderSide(), // Borde blanco
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
