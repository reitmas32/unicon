import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/ui/packages/section_scroll.dart';
import 'package:unicon/ui/views/home_body.dart';
import 'package:unicon/ui/views/pre_register.dart';
import 'package:unicon/ui/views/schedule.dart';
import 'package:unicon/ui/views/vision.dart';

///
class SectionCollection extends StateNotifier<List<SectionModel<Widget>>> {
  ///
  SectionCollection()
      : super(
          <SectionModel<Widget>>[
            SectionModel<HomeBody>(
              name: 'Home  ',
              content: const HomeBody(),
              active: true,
            ),
            SectionModel<VisionSection>(
              name: 'Vision  ',
              content: const VisionSection(),
            ),
            SectionModel<Schedule>(
              name: 'Exibitor',
              content: const Schedule(),
            ),
            SectionModel<PreRegisterView>(
              name: 'Join Us ',
              content: const PreRegisterView(),
            ),
          ],
        );

  /// Func by activate section
  Future<bool> activateSection(int index) {
    state[index].active = true;

    state = <SectionModel<Widget>>[...state];

    return Future<bool>(() => true);
  }

  /// Func by go to Next section
  Future<int> goToNext() {
    int index = 0;
    for (final SectionModel<Widget> s in state) {
      if (s.active) {
        break;
      }
      index += 0;
    }
    return Future<int>(() => index);
  }

  /// Func by reset sections
  Future<bool> reset() {
    for (final SectionModel<Widget> e in state) {
      e.active = false;
    }
    state = <SectionModel<Widget>>[...state];

    return Future<bool>(() => true);
  }
}

/// Provider of Sections
final StateNotifierProvider<SectionCollection, List<SectionModel<Widget>>>
    sectionsProvider =
    StateNotifierProvider<SectionCollection, List<SectionModel<Widget>>>((
  StateNotifierProviderRef<SectionCollection, List<SectionModel<Widget>>> ref,
) {
  return SectionCollection();
});
