import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/atoms/simple_button_icon.dart';
import 'package:unicon/ui/organism/background.dart';

class CountDownPage extends StatelessWidget {
  const CountDownPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double fontSize = MediaQuery.of(context).size.aspectRatio > 0.6
        ? size.width / 50
        : size.width / 20;
    final double fontSizeCountDown =
        MediaQuery.of(context).size.aspectRatio > 0.7 ? 75 : 25;

    final double descriptionfontSizeCountDown =
        MediaQuery.of(context).size.aspectRatio > 0.7 ? 25 : 12;
    DateTime remainingTime = DateTime(2024, 2, 10);
    return Scaffold(
      body: BackGroundWidget(
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 30,
              child: SimpleIconButton(onPressed: () => context.go('/')),
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
                    width: MediaQuery.of(context).size.aspectRatio > 0.5
                        ? size.width / 2
                        : size.width / 1,
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
      ),
    );
  }
}
