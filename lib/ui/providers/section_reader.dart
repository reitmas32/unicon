import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
final StateProvider<ScrollController> sectionsReaderProvider =
    StateProvider<ScrollController>((
  StateProviderRef<ScrollController> ref,
) {
  return ScrollController();
});
