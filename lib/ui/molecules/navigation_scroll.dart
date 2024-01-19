import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/section_model.dart';
import 'package:unicon/ui/providers/scroll.dart';
import 'package:unicon/ui/providers/sections.dart';

class NavigatorScroll extends ConsumerWidget {
  const NavigatorScroll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections = ref.watch(sectionsProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: sections
            .map((e) => [
                  ScrollButton(
                    section: e,
                  ),
                  if (e != sections.last) const SizedBox(height: 16.0),
                ])
            .expand((element) => element)
            .toList(),

        // Puedes añadir más círculos según sea necesario
      ),
    );
  }
}

class ScrollButton extends ConsumerStatefulWidget {
  const ScrollButton({
    super.key,
    required this.section,
  });

  final SectionModel<dynamic> section;

  @override
  ConsumerState<ScrollButton> createState() => _ScrollButtonState();
}

class _ScrollButtonState extends ConsumerState<ScrollButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: GoogleFonts.jetBrainsMono(
            color: widget.section.active ? Colors.white : Colors.transparent,
          ),
          child: Text(
            widget.section.name,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
            child: CircleContainer(
              10.0,
              widget.section.active ? Colors.white : Colors.grey,
            ),
            onTap: () => goToIndex(widget.section.id)),
      ],
    );
  }

  void goToIndex(int index) {
    ref.read(sectionsProvider.notifier).reset();
    ref.read(sectionsProvider.notifier).activateSection(widget.section.id);
    final contentScrollController = ref.read(scrollProvider);
    contentScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final double radius;
  final Color color;

  const CircleContainer(this.radius, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
