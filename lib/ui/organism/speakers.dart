import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/speaker.dart';
import 'package:unicon/domain/providers/speakers.dart';
import 'package:unicon/ui/molecules/speaker_card.dart';

/// SpeakersContent
class SpeakersContent extends ConsumerWidget {
  ///
  const SpeakersContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    final double widthContent = MediaQuery.of(context).size.aspectRatio > 0.7
        ? size.height * 0.8
        : size.width;

    final List<SpeakerModel> speakers = ref.watch(speakersProvider);

    return SizedBox(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 600,
            child: Column(
              children: <Widget>[
                SelectableText(
                  'Invitados',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SelectableText(
                  '''
Divulgadores y profesionales de la \n comunidad de programación y la tecnología.''',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: widthContent + 300 < size.width
                ? widthContent + 250
                : widthContent,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: speakers.map((SpeakerModel speaker) {
                return SpeakerCard(speaker: speaker);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
