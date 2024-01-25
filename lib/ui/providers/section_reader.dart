import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionReaderCollection extends StateNotifier<List<bool>> {
  SectionReaderCollection()
      : super(
          [
            false,
            false,
            false,
            false,
            false,
          ],
        );

  Future<bool> activateSection(int index) {
    state[index] = true;

    state = [...state];

    return Future(() => true);
  }

  Future<bool> reset() {
    state.fillRange(0, state.length, false);
    state = [...state];

    return Future(() => true);
  }
}

final sectionsReaderProvider =
    StateNotifierProvider<SectionReaderCollection, List<bool>>((ref) {
  return SectionReaderCollection();
});
