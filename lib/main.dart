import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/ui/unicon.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (BuildContext context) => const ProviderScope(
        child: UniConApp(),
      ),
    ),
  );
}
