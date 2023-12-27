import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/ui/organism/background.dart';
import 'package:unicon/ui/organism/count_down.dart';
import 'package:unicon/ui/organism/home_body.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:unicon/ui/organism/speakers.dart';
import 'package:unicon/ui/organism/talks.dart';
import 'package:unicon/ui/providers/scroll.dart';

class HomePage extends ConsumerWidget {
  HomePage({
    super.key,
  });

  static const elements = [
    HomeBody(),
    CountDownContent(),
    SpeakersContent(),
    TalksContent(),
    SizedBox(
      height: 300,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentScrollController = ref.watch(scrollProvider);

    return Scaffold(
      body: BackGroundWidget(
        child: ScrollablePositionedList.builder(
          itemScrollController: contentScrollController,
          shrinkWrap: true,
          itemCount: elements.length,
          itemBuilder: (BuildContext context, int index) {
            return elements[index];
          },
        ),
      ),
    );
  }
}
