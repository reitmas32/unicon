import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/ui/organism/background.dart';
import 'package:unicon/ui/organism/pre_register_layer.dart';
import 'package:unicon/ui/packages/section_scroll.dart';
import 'package:unicon/ui/providers/section_reader.dart';
import 'package:unicon/ui/providers/sections.dart';

///
class HomePage extends ConsumerStatefulWidget {
  ///
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<SectionModel<Widget>> sections = ref.watch(sectionsProvider);
    final ScrollController scrollController = ref.watch(sectionsReaderProvider);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGroundWidget(
        child: Stack(
          children: <Widget>[
            const PreRegisterLayer(),
            Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.13,
                ),
                Expanded(
                  child: SectionScroll(
                    controller: scrollController,
                    showLabels: true,
                    activeTab: const CircleContainer(
                      radius: 20,
                      color: Colors.white,
                    ),
                    deactiveTab: const CircleContainer(
                      radius: 20,
                      color: Colors.grey,
                    ),
                    children: sections,
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

  int getIndex(double scrollPosition) {
    return (scrollPosition + MediaQuery.of(context).size.height * 0.25) ~/
        MediaQuery.of(context).size.height;
  }
}
