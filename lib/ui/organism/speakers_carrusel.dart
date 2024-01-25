import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/providers/speakers.dart';
import 'package:unicon/ui/molecules/speaker_card.dart';

class SpeakersCarrusel extends ConsumerWidget {
  const SpeakersCarrusel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exhibitors = ref.watch(speakersProvider);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 400,
      child: FlutterCarousel(
        items: exhibitors
            .map(
              (e) => SpeakerCard(speaker: e),
            )
            .toList(),
        options: CarouselOptions(
          height: 350.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.4,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.linear,
          enlargeCenterPage: true,
          controller: CarouselController(),
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
    );
  }
}
