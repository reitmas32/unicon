import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/atoms/auth_button.dart';
import 'package:unicon/ui/organism/register_dialog.dart';
import 'package:unicon/ui/organism/siging_dialog.dart';
import 'package:unicon/ui/providers/scroll.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  ConsumerState<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double fontSize =
        size.height > 1200 ? size.height / 70 : size.height / 50;

    final widthContent = MediaQuery.of(context).size.aspectRatio > 0.7
        ? size.height * 0.8
        : size.width;

    final double fontSizeCountDown =
        MediaQuery.of(context).size.aspectRatio > 0.7 ? 75 : 25;

    final double descriptionfontSizeCountDown =
        MediaQuery.of(context).size.aspectRatio > 0.7 ? 25 : 12;

    DateTime remainingTime = DateTime(2024, 5, 10);

    return SizedBox(
      height: size.height,
      child: Center(
        child: SizedBox(
          width: widthContent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(
                "https://raw.githubusercontent.com/reitmas32/unicon/1129ea9afbb29c0a299c8684a345b47202bc7eaa/assets/unicon.svg",
                height: size.height / 4,
              ),
              SizedBox(
                width: widthContent - 50,
                child: SelectableText(
                  "Networking with Passion: Collaborate with Tech Enthusiasts and Innovators",
                  style: GoogleFonts.jetBrainsMono(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
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
                daysDescription: "DÍAS",
                hoursDescription: "HRS",
                minutesDescription: "MIN",
                secondsDescription: "SEC",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleButtonModel {
  final String lable;
  final VoidCallback onPressed;

  SimpleButtonModel({required this.lable, required this.onPressed});
}
