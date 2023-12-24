import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/atoms/simple_button.dart';
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
                      "Prepárate para ponencias inspiradoras, sesiones de co-working y oportunidades inigualables de networking.",
                      style: GoogleFonts.jetBrainsMono(fontSize: fontSize),
                      textAlign: TextAlign.center,
                    ),
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
    final size = MediaQuery.of(context).size;

    final widthContent = MediaQuery.of(context).size.aspectRatio > 0.7
        ? size.height * 0.8
        : size.width;

    final bool centerButton = size.width < size.height;
    return [
      if (!centerButton)
        Positioned(
          top: 80,
          right: 80 + ((size.width - widthContent) / 2),
          child: SimpleButton(
            onPressed: () {
              final contentScrollController = ref.read(scrollProvider);
              contentScrollController.scrollTo(
                index: 1,
                duration: Duration(milliseconds: 500),
              );
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
                  onPressed: () {
                    final contentScrollController = ref.read(scrollProvider);
                    contentScrollController.scrollTo(
                      index: 1,
                      duration: Duration(milliseconds: 500),
                    );
                  },
                  lable: "Llamado a la acción",
                ),
                /*
              SimpleButton(
                onPressed: () {},
                lable: "¿Qué esperamos?",
              ),
              SimpleButton(
                onPressed: () {},
                lable: "¿Qué queremos?",
              ),
              */
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
}
