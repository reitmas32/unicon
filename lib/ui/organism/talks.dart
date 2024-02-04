import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/talk.dart';
import 'package:unicon/domain/providers/talks.dart';

///
class TalksContent extends ConsumerWidget {
  ///
  const TalksContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TalkModel> talks = ref.watch(talksProvider);

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
                  'Agenda 2024',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SelectableText(
                  'Todas las Charlas estar disponibles despues del evento',
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
          Column(
            children: talks.map((TalkModel talk) {
              return TalkCard(talk: talk);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

///
class TalkCard extends StatelessWidget {
  ///
  const TalkCard({
    super.key,
    required this.talk,
  });

  /// Model
  final TalkModel talk;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double widthContent = MediaQuery.of(context).size.aspectRatio > 0.7
        ? size.height * 0.7
        : size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: widthContent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widthContent < size.width)
            Text(
              '${talk.start} - ${talk.end}',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 15,
              ),
            ),
          const SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: VerticalDivider(
                thickness: 0.5,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: widthContent - (widthContent < size.width ? 180 : 50),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (widthContent >= size.width)
                  Text(
                    '${talk.start} - ${talk.end}',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 15,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    talk.title,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 25,
                      color: const Color(0xFFCDB4C7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  talk.description,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 180, 195, 205),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 85,
                      width: 85,
                      child: ClipOval(
                        child: Image.network(
                          talk.speaker.img,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          talk.speaker.name,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          talk.speaker.job,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
