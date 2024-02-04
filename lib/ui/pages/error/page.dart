import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/organism/background.dart';

///
class ErrorPage extends StatelessWidget {
  ///
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidget(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectableText(
                '404',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 70,
                width: 30,
                child: VerticalDivider(
                  color: Colors.white,
                  width: 4,
                  thickness: 3,
                ),
              ),
              SelectableText(
                'Ups.. Page Not Found',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
