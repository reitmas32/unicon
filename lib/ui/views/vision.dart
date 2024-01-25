import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/providers/areas.dart';
import 'package:unicon/domain/providers/our.dart';
import 'package:unicon/ui/molecules/our.dart';

class VisionSection extends ConsumerWidget {
  const VisionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ours = ref.watch(oursProvider);
    final areas = ref.watch(areasProvider);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.87,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: SizedBox(
              height: size.height * 0.23,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: ours
                    .map((e) => [
                          Expanded(
                            flex: 1,
                            child: OurWidget(
                              ourModel: e,
                            ),
                          ),
                          if (e != ours.last) const VerticalDivider(),
                        ])
                    .expand((element) => element)
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.6,
            width: size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Areas",
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 200,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: areas
                            .map(
                              (e) => AreaWidget(
                                lable: e,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AreaWidget extends StatefulWidget {
  const AreaWidget({
    super.key,
    required this.lable,
  });

  final String lable;

  @override
  State<AreaWidget> createState() => _AreaWidgetState();
}

class _AreaWidgetState extends State<AreaWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 150),
          tween: Tween<double>(begin: 0, end: isHover ? -10 : 0),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.translate(
              offset: Offset(value, 0),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 150),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: isHover ? 25 : 20,
                  fontWeight: isHover ? FontWeight.bold : FontWeight.normal,
                  color: isHover ? Colors.white : Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.lable,
                  ),
                ),
              ),
            );
          }),
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
    );
  }
}
