import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/section_model.dart';
import 'package:unicon/ui/views/home_body.dart';
import 'package:unicon/ui/views/pre_register.dart';
import 'package:unicon/ui/views/vision.dart';

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
            //SectionModel<Schedule>(
            //  name: "Exibitor",
            //  content: const Schedule(),
            //),
            SectionModel<PreRegisterView>(
              name: "Join Us",
              content: const PreRegisterView(),
            ),
          ],
        );

  Future<bool> activateSection(int index) {
    state[index].active = true;

    state = [...state];

    return Future(() => true);
  }

  Future<int> goToNext() {
    int index = 0;
    for (SectionModel<Widget> s in state) {
      if (s.active) {
        break;
      }
      index += 0;
    }
    return Future(() => index);
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
