// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// /// Represents a section model with a name, content, id and active state
class SectionModel<T> {
  /// Contructor
  SectionModel({
    required this.name,
    required this.content,
    this.active = false,
  }) {
    this.id = SectionModel._id;
    SectionModel._id += 1;
  }

  /// The name of the section
  final String name;

  /// The content of the section
  final T content;

  /// Whether this section is currently active/selected
  late bool active;

  /// A unique id for this section
  late final int id;

  /// Incrementing id for each section
  static int _id = 0;
}

class SectionScroll extends StatefulWidget {
  const SectionScroll({
    super.key,
    required this.controller,
    // ignore: always_specify_types
    this.children = const <SectionModel>[],
    this.activeTab,
    this.deactiveTab,
    this.curve,
    this.duration,
    this.showLabels = false,
  });
  final ScrollController controller;
  // ignore: always_specify_types
  final List<SectionModel> children;
  final Widget? activeTab;
  final Widget? deactiveTab;
  final Duration? duration;
  final Curve? curve;
  final bool showLabels;

  @override
  SectionScrollState createState() => SectionScrollState();
}

class SectionScrollState extends State<SectionScroll> {
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateScrollPosition);
  }

  void _updateScrollPosition() {
    setState(() {
      _scrollPosition = widget.controller.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          controller: widget.controller,
          itemCount: widget.children.length,
          itemExtent: MediaQuery.of(context).size.height,
          itemBuilder: (BuildContext context, int index) {
            return widget.children[index].content;
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...widget.children
                    .asMap()
                    .entries
                    // ignore: always_specify_types
                    .map((MapEntry<int, SectionModel> entry) {
                  final int index = entry.key;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => updateSection(index),
                      child: isActive(index)
                          ? getActiveWidget(index)
                          : getDeactiveWidget(index),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  int indexHoverd = -1;

  Widget getActiveWidget(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        if (widget.showLabels) ...<Widget>[
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: indexHoverd != index ? Colors.transparent : Colors.white,
            ),
            child: Text(widget.children[index].name),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
        const SizedBox(width: 10),
        MouseRegion(
          onEnter: (_) => setState(() {
            indexHoverd = index;
          }),
          onExit: (_) => setState(() {
            indexHoverd = -1;
          }),
          child: widget.activeTab ??
              const CircleContainer(
                radius: 20,
                color: Colors.red,
              ),
        ),
      ],
    );
  }

  Widget getDeactiveWidget(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (widget.showLabels) ...<Widget>[
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: indexHoverd != index ? Colors.transparent : Colors.white,
            ),
            child: Text(
              widget.children[index].name,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
        const SizedBox(width: 10),
        MouseRegion(
          onEnter: (_) => setState(() {
            indexHoverd = index;
          }),
          onExit: (_) => setState(() {
            indexHoverd = -1;
          }),
          child: widget.deactiveTab ??
              const CircleContainer(
                radius: 20,
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  bool isActive(int index) {
    return (_scrollPosition + MediaQuery.of(context).size.height * 0.25) ~/
            MediaQuery.of(context).size.height ==
        index;
  }

  void updateSection(int index) => setState(() {
        widget.controller.animateTo(
          index * MediaQuery.of(context).size.height,
          duration: widget.duration ?? const Duration(milliseconds: 500),
          curve: widget.curve ?? Curves.linear,
        );
      });
}

class CircleContainer extends StatefulWidget {
  const CircleContainer({this.radius, this.color, super.key});
  final double? radius;
  final Color? color;

  @override
  State<CircleContainer> createState() => _CircleContainerState();
}

class _CircleContainerState extends State<CircleContainer> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        isHovered = true;
      }),
      onExit: (_) => setState(() {
        isHovered = false;
      }),
      child: AnimatedScale(
        scale: isHovered ? 1.3 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: widget.radius ?? 20 * 2,
          height: widget.radius ?? 20 * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
