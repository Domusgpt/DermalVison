import 'dart:math' as math;
import 'package:flutter/material.dart';

class DepthScrollView extends StatefulWidget {
  const DepthScrollView({super.key, required this.children});

  final List<Widget> children;

  @override
  State<DepthScrollView> createState() => _DepthScrollViewState();
}

class _DepthScrollViewState extends State<DepthScrollView> {
  late PageController _controller;
  double _page = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.6);
    _controller.addListener(() {
      setState(() {
        _page = _controller.page!;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        double position = index - _page;

        // Water-around-sphere effect
        // 0 at center. +1 below, -1 above.
        // We want items to curve away.

        double absPos = position.abs();
        double scale = (1.0 - (absPos * 0.3)).clamp(0.0, 1.0);
        double opacity = (1.0 - (absPos * 0.6)).clamp(0.0, 1.0);
        double xOffset = math.sin(position * math.pi / 2) * 100;
        double zDepth = absPos * 200;

        final matrix = Matrix4.identity()
          ..setEntry(3, 2, 0.002) // Perspective
          ..translate(xOffset, 0, -zDepth) // Push back
          ..scale(scale);

        return Transform(
          transform: matrix,
          alignment: Alignment.center,
          child: Opacity(
            opacity: opacity,
            child: widget.children[index],
          ),
        );
      },
    );
  }
}
