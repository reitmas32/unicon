import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';

/// Countdown timer Widget
class CountDownContent extends ConsumerWidget {
  /// Constructor
  const CountDownContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final double fontSize =
        size.height > 1200 ? size.height / 70 : size.height / 50;

    final double fontSizeCountDown =
        MediaQuery.of(context).size.aspectRatio > 0.7 ? 75 : 25;

    final double descriptionfontSizeCountDown =
        MediaQuery.of(context).size.aspectRatio > 0.7 ? 25 : 12;

    final double widthContent = MediaQuery.of(context).size.aspectRatio > 0.7
        ? size.height * 0.8
        : size.width;

    final DateTime remainingTime = DateTime(2024, 5, 10);
    return SizedBox(
      height: size.height - 300,
      width: widthContent,
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/unicon.svg',
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
                    '''
Próximamente: Un evento sin precedentes en la Ciudad de México para el intercambio de ideas y experiencias.''',
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
