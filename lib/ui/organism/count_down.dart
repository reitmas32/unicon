import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/atoms/simple_button_icon.dart';
import 'package:unicon/ui/providers/scroll.dart';

class CountDownContent extends ConsumerWidget {
  const CountDownContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final double fontSize =
        size.height > 1200 ? size.height / 70 : size.height / 50;

    final double fontSizeCountDown =
        MediaQuery.of(context).size.aspectRatio > 0.7 ? 75 : 25;

    final double descriptionfontSizeCountDown =
        MediaQuery.of(context).size.aspectRatio > 0.7 ? 25 : 12;

    final widthContent = MediaQuery.of(context).size.aspectRatio > 0.7
        ? size.height * 0.8
        : size.width;

    DateTime remainingTime = DateTime(2024, 2, 10);
    return SizedBox(
      height: size.height,
      width: widthContent,
      child: Stack(
        children: [
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Center(
              child: SimpleIconButton(
                onPressed: () {
                  final contentScrollController = ref.read(scrollProvider);
                  contentScrollController.scrollTo(
                    index: 0,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                icon: Icon(Icons.arrow_upward),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                  "https://raw.githubusercontent.com/reitmas32/unicon/1129ea9afbb29c0a299c8684a345b47202bc7eaa/assets/unicon.svg",
                  height: size.height / 4,
                ),
                TimerCountdown(
                  endTime: remainingTime,
                  timeTextStyle: GoogleFonts.jetBrainsMono(
                    fontSize: fontSizeCountDown,
                  ),
                  colonsTextStyle: GoogleFonts.jetBrainsMono(
                    fontSize: fontSizeCountDown,
                  ),
                  descriptionTextStyle: GoogleFonts.jetBrainsMono(
                    fontSize: descriptionfontSizeCountDown,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: widthContent - (widthContent == size.width ? 50 : 200),
                  child: SelectableText(
                    "Próximamente: Un evento sin precedentes en la Ciudad de México para el intercambio de ideas y experiencias.",
                    style: GoogleFonts.jetBrainsMono(fontSize: fontSize),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
