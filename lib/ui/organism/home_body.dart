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

    DateTime remainingTime = DateTime(2024, 2, 10);

    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          ...buttonsLayer(),
          Center(
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
        ],
      ),
    );
  }

  List<Widget> buttonsLayer() {
    final buttons = [
      SimpleButtonModel(
        lable: "Log In",
        onPressed: () => sigInDialog(),
      ),
      SimpleButtonModel(
        lable: "Register",
        onPressed: () => registerDialog(),
      ),
    ];

    return [
      Positioned(
        top: 80,
        right: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buttons
              .map((e) => [
                    AuthButton(
                      label: e.lable,
                      onPress: e.onPressed,
                    ),
                    if (e != buttons.last)
                      Text(
                        " | ",
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 27,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                  ])
              .expand((element) => element)
              .toList(),
        ),
      ),
    ];
  }

  void goToIndex(int index) {
    final contentScrollController = ref.read(scrollProvider);
    contentScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
    );
  }

  void sigInDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SigInDialog();
        },
      );

  void registerDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const RegisterDialog();
        },
      );
}

class SimpleButtonModel {
  final String lable;
  final VoidCallback onPressed;

  SimpleButtonModel({required this.lable, required this.onPressed});
}
