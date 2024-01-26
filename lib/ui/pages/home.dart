import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section_scroll/section_scroll.dart';
import 'package:unicon/ui/organism/background.dart';
import 'package:unicon/ui/organism/pre_register_layer.dart';
import 'package:unicon/ui/providers/section_reader.dart';
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
    final sections = ref.watch(sectionsProvider);
    final scrollController = ref.watch(sectionsReaderProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGroundWidget(
        child: Stack(
          children: [
            const PreRegisterLayer(),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.13,
                ),
                Expanded(
                  child: SectionScroll(
                    controller: scrollController,
                    children: [...sections.map((e) => e.content).toList()],
                  ),
                ),
              ],
            ),
            //const AuthLayer(),
          ],
        ),
      ),
    );
  }
}
