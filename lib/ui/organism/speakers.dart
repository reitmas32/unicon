import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeakerModel {
  SpeakerModel({required this.img, required this.name, required this.job});

  final String img;
  final String name;
  final String job;
}

final List<SpeakerModel> spakers = [
  SpeakerModel(
    img: "https://www.miduconf.com/img/speakers/rauchg.jpg",
    name: "Gullermo Rauch",
    job: "CEO @ Vercel",
  ),
  SpeakerModel(
    img: "https://www.miduconf.com/img/speakers/carmen.jpg",
    name: "Carmen Ansio",
    job: "UX Engineer Freelance",
  ),
  SpeakerModel(
    img: "https://www.miduconf.com/img/speakers/david.jpg",
    name: "David Bonilla",
    job: "CEO @ Manfred",
  ),
  SpeakerModel(
    img: "https://www.miduconf.com/img/speakers/debbie.jpg",
    name: "Gullermo Rauch",
    job: "CEO @ Vercel",
  ),
  SpeakerModel(
    img: "https://www.miduconf.com/img/speakers/frr149.jpg",
    name: "Carmen Ansio",
    job: "UX Engineer Freelance",
  ),
  SpeakerModel(
    img: "https://www.miduconf.com/img/speakers/nerea.jpg",
    name: "David Bonilla",
    job: "CEO @ Manfred",
  ),
  SpeakerModel(
    img: "https://www.miduconf.com/img/speakers/fernando.jpg",
    name: "Carmen Ansio",
    job: "UX Engineer Freelance",
  ),
  SpeakerModel(
    img: "https://www.miduconf.com/img/speakers/east.jpg",
    name: "David Bonilla",
    job: "CEO @ Manfred",
  ),
];

class SpeakersContent extends ConsumerWidget {
  const SpeakersContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final widthContent = MediaQuery.of(context).size.aspectRatio > 0.7
        ? size.height * 0.8
        : size.width;

    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 600,
            child: Column(
              children: [
                SelectableText(
                  "Invitados",
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SelectableText(
                  "Divulgadores y profesionales de la \n comunidad de programación y la tecnología.",
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
            width:
                widthContent != size.width ? widthContent + 100 : widthContent,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: spakers.map((speaker) {
                return SpeakerCard(speaker: speaker);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class SpeakerCard extends StatefulWidget {
  const SpeakerCard({
    super.key,
    required this.speaker,
  });

  final SpeakerModel speaker;

  @override
  State<SpeakerCard> createState() => _SpeakerCardState();
}

class _SpeakerCardState extends State<SpeakerCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        isHover = true;
      }),
      onExit: (event) => setState(() {
        isHover = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: 250,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0x88CDB4C7),
                isHover ? const Color(0x05CDB4C7) : Colors.transparent,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(
                    milliseconds: 300), // Duración de la animación
                curve: Curves.easeInOut, // Curva de la animación
                transform: isHover
                    ? (Matrix4.identity()
                      ..translate(-0.05 * 170,
                          -0.05 * 170) // translate towards right and down
                      ..scale(1.1, 1.1))
                    : Matrix4.identity(),
                child: ClipOval(
                  child: Image.network(
                    widget.speaker.img,
                    height: 170,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.speaker.name,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.speaker.job,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 18,
                  color: const Color(0xFFCDB4C7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
