import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/speaker.dart';
import 'package:unicon/domain/providers/speakers.dart';
import 'package:unicon/ui/molecules/speaker_card.dart';

/// SpeakersCarrusel
class SpeakersCarrusel extends ConsumerStatefulWidget {
  ///5
  SpeakersCarrusel({super.key});

  @override
  ConsumerState<SpeakersCarrusel> createState() => _SpeakersCarruselState();
}

class _SpeakersCarruselState extends ConsumerState<SpeakersCarrusel> {
  final CarouselController controller = CarouselController();
  int currentCard = 0;

  @override
  Widget build(BuildContext context) {
    final List<SpeakerModel> exhibitors = ref.watch(speakersProvider);
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 400,
      child: FlutterCarousel(
        items: exhibitors.asMap().entries.map((entry) {
          final int index = entry.key;
          final SpeakerModel spk = entry.value;
          return AnimatedOpacity(
            opacity: index == currentCard ? 1.0 : 0.7,
            duration: const Duration(milliseconds: 400),
            child: SpeakerCard(
              speaker: spk,
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 350.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.4,
          enableInfiniteScroll: true,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              currentCard = index;
            });
          },
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.linear,
          enlargeCenterPage: true,
          controller: controller,
        ),
      ),
    );
  }
}
