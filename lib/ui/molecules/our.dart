import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/our.dart';

class OurWidget extends StatelessWidget {
  const OurWidget({
    super.key,
    required this.ourModel,
  });

  final OurModel ourModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ourModel.title,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            ourModel.description,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
