import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/speaker.dart';
import 'package:unicon/domain/providers/speakers.dart';
import 'package:unicon/ui/molecules/speaker_card.dart';

/// SpeakersCarrusel
class SpeakersCarrusel extends ConsumerWidget {
  ///
  const SpeakersCarrusel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SpeakerModel> exhibitors = ref.watch(speakersProvider);
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 400,
      child: FlutterCarousel(
        items: exhibitors
            .map(
              (SpeakerModel e) => SpeakerCard(speaker: e),
            )
            .toList(),
        options: CarouselOptions(
          height: 350.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.4,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.linear,
          enlargeCenterPage: true,
          controller: CarouselController(),
        ),
      ),
    );
  }
}
