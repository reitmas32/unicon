import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/talk.dart';
import 'package:unicon/domain/providers/talks.dart';
import 'package:unicon/ui/organism/speakers_carrusel.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                "Our exhibitors",
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SpeakersCarrusel(),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                "Schedule",
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const ScheduleCarrusel()
            ],
          ),
        ),
      ],
    );
  }
}

class ScheduleCarrusel extends ConsumerStatefulWidget {
  const ScheduleCarrusel({super.key});

  @override
  ConsumerState<ScheduleCarrusel> createState() => _ScheduleCarruselState();
}

class _ScheduleCarruselState extends ConsumerState<ScheduleCarrusel> {
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final exhibitors = ref.watch(talksProvider);
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          flex: 5,
          child: SizedBox(
            width: size.width / 1.4,
            height: size.height / 4,
            child: FlutterCarousel(
              items: exhibitors
                  .map(
                    (e) => TalkCard(talk: e),
                  )
                  .toList(),
              options: CarouselOptions(
                height: size.height / 4,
                aspectRatio: 16 / 9,

                viewportFraction: 0.4,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.linear,
                enlargeCenterPage: false,
                controller: controller,
                //onPageChanged: callbackFunction,
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                pauseAutoPlayOnTouch: true,
                pauseAutoPlayOnManualNavigate: true,
                pauseAutoPlayInFiniteScroll: false,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                disableCenter: false,
                showIndicator: true,
                //floatingIndicator = true,
                slideIndicator: const CircularSlideIndicator(),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: IconButton(
              onPressed: () {
                setState(() {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 200));
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TalkCard extends StatelessWidget {
  const TalkCard({super.key, required this.talk});

  final TalkModel talk;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        width: size.width / 4,
        height: 350,
        color: Colors.purple.withAlpha(50),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              talk.start,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              talk.title,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 20,
              ),
            ),
            Text(
              talk.description,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 15,
              ),
            ),
            Text(
              talk.speaker.name,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
