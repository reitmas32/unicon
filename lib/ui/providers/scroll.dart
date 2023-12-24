import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollUnicon extends StateNotifier<ItemScrollController> {
  ScrollUnicon() : super(ItemScrollController());

  Future scrollToItem(int index, Size size) async {
    state.scrollTo(
      index: index,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.decelerate,
    );
  }
}

final scrollProvider =
    StateNotifierProvider<ScrollUnicon, ItemScrollController>((ref) {
  return ScrollUnicon();
});
