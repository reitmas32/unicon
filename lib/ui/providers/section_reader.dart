import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sectionsReaderProvider = StateProvider<ScrollController>((ref) {
  return ScrollController();
});
