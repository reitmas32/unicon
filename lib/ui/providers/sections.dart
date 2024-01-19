import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/section_model.dart';
import 'package:unicon/ui/organism/home_body.dart';
import 'package:unicon/ui/organism/vision.dart';

class SectionCollection extends StateNotifier<List<SectionModel<Widget>>> {
  SectionCollection()
      : super(
          [
            SectionModel<HomeBody>(
              name: "Home",
              content: const HomeBody(),
              active: true,
            ),
            SectionModel<VisionSection>(
              name: "Vision",
              content: const VisionSection(),
            ),
            SectionModel<HomeBody>(
              name: "Exibitor",
              content: const HomeBody(),
            ),
            SectionModel<HomeBody>(
              name: "Join Us",
              content: const HomeBody(),
            ),
            SectionModel<HomeBody>(
                name: "Become Speaker", content: const HomeBody()),
          ],
        );

  Future<bool> activateSection(int index) {
    state[index].active = true;

    state = [...state];

    return Future(() => true);
  }

  Future<bool> reset() {
    for (var e in state) {
      e.active = false;
    }
    state = [...state];

    return Future(() => true);
  }
}

final sectionsProvider =
    StateNotifierProvider<SectionCollection, List<SectionModel>>((ref) {
  return SectionCollection();
});
