import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/speaker.dart';

class SpeakerCard extends StatelessWidget {
  const SpeakerCard({super.key, required this.speaker});

  final SpeakerModel speaker;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 200,
      child: Stack(
        children: [
          //color: Color(0xD45C182A),
          //color: Color(0x28828282)
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color(0xD45C182A),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: const Color(0x28828282),
                ),
              ),
            ],
          ),
          Center(
            child: Row(
              children: [
                const SizedBox(
                  width: 100,
                ),
                Image.asset(
                  speaker.img,
                  height: 250,
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          speaker.name,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Text(
                            speaker.description,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: speaker.tags
                              .map((e) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    child: Text(e),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
