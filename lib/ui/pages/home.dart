import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/atoms/simple_button.dart';
import 'package:unicon/ui/organism/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double fontSize = MediaQuery.of(context).size.aspectRatio > 0.6
        ? size.width / 50
        : size.width / 20;

    return Scaffold(
      body: BackGroundWidget(
        child: Stack(
          children: [
            ...buttonsLayer(context),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.network(
                    "https://raw.githubusercontent.com/reitmas32/unicon/1129ea9afbb29c0a299c8684a345b47202bc7eaa/assets/unicon.svg",
                    height: size.height / 4,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.aspectRatio > 0.5
                        ? size.width / 2
                        : size.width / 1.2,
                    child: SelectableText(
                      "Prepárate para ponencias inspiradoras, sesiones de co-working y oportunidades inigualables de networking.",
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

List<Widget> buttonsLayer(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final bool centerButton = size.width < size.height;
  return [
    if (!centerButton)
      Positioned(
        top: 80,
        right: 80,
        child: SimpleButton(
          onPressed: () {
            context.go("/coming-soon");
          },
          lable: "Comprar Tikects",
        ),
      ),
    if (!centerButton)
      Positioned(
        bottom: 80,
        right: 0,
        left: 0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SimpleButton(
                onPressed: () {},
                lable: "Llamado a la acción",
              ),
              SimpleButton(
                onPressed: () {},
                lable: "¿Qué esperamos?",
              ),
              SimpleButton(
                onPressed: () {},
                lable: "¿Qué queremos?",
              ),
            ],
          ),
        ),
      ),
    if (centerButton)
      Positioned(
        top: 80,
        right: 0,
        left: 0,
        child: Center(
          child: SimpleButton(
            onPressed: () {
              context.go("/coming-soon");
            },
            lable: "Comprar Tikects",
          ),
        ),
      ),
    if (centerButton)
      Positioned(
        bottom: 80,
        right: 0,
        left: 0,
        child: Center(
          child: SimpleButton(
            onPressed: () {
              context.go("/coming-soon");
            },
            lable: "¿Qué esperamos?",
          ),
        ),
      ),
  ];
}
