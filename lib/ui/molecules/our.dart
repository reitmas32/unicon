import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/our.dart';

/// Our Widget
class OurWidget extends StatelessWidget {
  /// Contructor
  const OurWidget({
    super.key,
    required this.ourModel,
  });

  /// Model
  final OurModel ourModel;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.aspectRatio > 1.5 ? size.height * 0.4 : size.height * 0.25,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ourModel.title,
              style: GoogleFonts.jetBrainsMono(
                fontSize: size.aspectRatio > 1.5 ? 30 : 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              ourModel.description,
              style: GoogleFonts.jetBrainsMono(
                fontSize: size.aspectRatio > 1.5 ? 20 : 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
