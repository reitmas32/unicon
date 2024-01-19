import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/atoms/auth_button.dart';
import 'package:unicon/ui/molecules/navigation_scroll.dart';
import 'package:unicon/ui/organism/background.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:unicon/ui/organism/home_body.dart';
import 'package:unicon/ui/organism/register_dialog.dart';
import 'package:unicon/ui/organism/siging_dialog.dart';
import 'package:unicon/ui/providers/scroll.dart';
import 'package:unicon/ui/providers/sections.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final contentScrollController = ref.watch(scrollProvider);

    final sections = ref.watch(sectionsProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGroundWidget(
        child: Stack(
          children: [
            ...buttonsLayer(),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.13,
                ),
                Expanded(
                  child: ScrollablePositionedList.builder(
                    itemScrollController: contentScrollController,
                    shrinkWrap: true,
                    itemCount: sections.length,
                    itemBuilder: (BuildContext context, int index) {
                      return sections[index].content;
                    },
                  ),
                ),
              ],
            ),
            const Align(
                alignment: Alignment.centerRight, child: NavigatorScroll()),
          ],
        ),
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
